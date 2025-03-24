import 'package:app/model/ranking_user.dart';
import 'package:app/model/share_favor.dart';
import 'package:app/model/share_favor_request.dart';
import 'package:app/model/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_client.g.dart';

@riverpod
ApiClient apiClient(Ref ref) => ApiClient();

class ApiClient {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'http://127.0.0.1:5000/'))
    ..interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: false,
      responseBody: true,
      responseHeader: false,
      error: true,
    ));

  Future<ApiResponse> getByCursor(String? cursor) async {
    cursor ??= '0';
    final response =
        await _dio.get('/records', queryParameters: {'cursor': cursor});

    final data = response.data as Map<String, dynamic>;

    final items = (data['items'] as List<dynamic>)
        .map((item) => ShareFavor.fromJson(item as Map<String, dynamic>))
        .toList();

    final nextCursor = data['nextCursor'] as String?;
    return ApiResponse(items: items, nextCursor: nextCursor);
  }

  Future<void> postShareFavor(ShareFavorRequest request) async {
    final formatter = DateFormat('yyyy-MM-dd HH:mm:ss');

    final data = {
      'user_id': request.userId,
      'received_favor_text': request.receivedFavorText,
      'received_favor_date': formatter.format(request.receivedFavorDate),
      'giver_name': request.giverName,
      'repaid_favor_text': request.repaidFavorText,
      'repaid_favor_date': formatter.format(request.repaidFavorDate),
      'memo': request.memo,
    };

    print("POST data: $data");

    await _dio.post(
      '/record/create',
      data: data,
    );
  }

  Future<User> createUser(String username) async {
    final response = await _dio.post(
      '/user/create',
      data: {'user_name': username},
    );

    final data = response.data as Map<String, dynamic>;

    return User.fromJson(data);
  }

  Future<User> updateUser(int userId, String newUsername) async {
    await _dio.put(
      '/user/changename',
      data: {
        'user_id': userId,
        'user_name': newUsername,
      },
    );

    // final data = response.data as Map<String, dynamic>;
    // return User.fromJson(data);
    return User(userId: userId, userName: newUsername);
  }

  Future<void> updateFavorCounts({
    required int userId,
    required int receivedFavorCount,
    required int repaidFavorCount,
  }) async {
    debugPrint(
        'receivedFavorCount: $receivedFavorCount, repaidFavorCount: $repaidFavorCount');
    await _dio.put(
      '/user/update',
      data: {
        'user_id': userId,
        'received_favor_count': receivedFavorCount,
        'repaid_favor_count': repaidFavorCount,
      },
    );
  }

  Future<List<RankingUser>> fetchRankingUsers() async {
    final response = await _dio.get('/user/ranking');
    final data = response.data as List<dynamic>;

    return data
        .map((item) => RankingUser.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}

class ApiResponse {
  final List<ShareFavor> items;
  final String? nextCursor;

  ApiResponse({required this.items, required this.nextCursor});
}

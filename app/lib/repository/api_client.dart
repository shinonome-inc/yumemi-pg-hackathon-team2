import 'package:app/model/share_favor.dart';
import 'package:app/model/user.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_client.g.dart';

@riverpod
ApiClient apiClient(ApiClientRef ref) => ApiClient();

class ApiClient {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'http://localhost:3000/'))
    ..interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: false,
      responseBody: true,
      responseHeader: false,
      error: true,
    ));

  Future<ApiResponse> getByCursor(String? cursor) async {
    final response =
        await _dio.get('/share-favors', queryParameters: {'cursor': cursor});

    final data = response.data as Map<String, dynamic>;

    final items = (data['items'] as List<dynamic>)
        .map((item) => ShareFavor.fromJson(item as Map<String, dynamic>))
        .toList();

    final nextCursor = data['nextCursor'] as String?;
    return ApiResponse(items: items, nextCursor: nextCursor);
  }

  Future<User> createUser(String username) async {
    final response = await _dio.post(
      '/user/create/',
      data: {'username': username},
    );

    final data = response.data as Map<String, dynamic>;
    return User.fromJson(data);
  }

  Future<User> updateUser(String userId, String newUsername) async {
    final response = await _dio.put(
      '/user/update/$userId',
      data: {'username': newUsername},
    );

    final data = response.data as Map<String, dynamic>;
    return User.fromJson(data);
  }
}

class ApiResponse {
  final List<ShareFavor> items;
  final String? nextCursor;

  ApiResponse({required this.items, required this.nextCursor});
}

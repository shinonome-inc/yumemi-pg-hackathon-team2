import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app/model/received_favor.dart';
import 'package:app/model/repaid_favor.dart';

class SharedPreferencesClient {
  static const _receivedFavorsKey = 'received_favors';
  static const _repaidFavorsKey = 'repaid_favors';

  // 📌 受けた恩の保存・取得
  Future<void> saveReceivedFavors(List<ReceivedFavor> favors) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = favors.map((favor) => jsonEncode(favor.toJson())).toList();
    await prefs.setStringList(_receivedFavorsKey, jsonList);
  }

  Future<List<ReceivedFavor>> loadReceivedFavors() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList(_receivedFavorsKey) ?? [];
    return jsonList
        .map((json) => ReceivedFavor.fromJson(jsonDecode(json)))
        .toList();
  }

  Future<void> clearReceivedFavors() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_receivedFavorsKey);
  }

  // 📌 奉公の保存・取得
  Future<void> saveRepaidFavors(List<RepaidFavor> favors) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = favors.map((favor) => jsonEncode(favor.toJson())).toList();
    await prefs.setStringList(_repaidFavorsKey, jsonList);
  }

  Future<List<RepaidFavor>> loadRepaidFavors() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList(_repaidFavorsKey) ?? [];
    return jsonList
        .map((json) => RepaidFavor.fromJson(jsonDecode(json)))
        .toList();
  }

  Future<void> clearRepaidFavors() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_repaidFavorsKey);
  }
}

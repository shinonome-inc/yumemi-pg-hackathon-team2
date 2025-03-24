import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:app/repository/api_client.dart';
import 'package:app/repository/shared_preferences_client.dart';
import 'package:app/model/user.dart';

part 'user_repository.g.dart';

@riverpod
UserRepository userRepository(Ref ref) => UserRepository(ref);

class UserRepository {
  UserRepository(this.ref);
  final Ref ref;

  /// 新規ユーザー作成&保存
  Future<User> createUser(String username) async {
    final apiClient = ref.read(apiClientProvider);
    final user = await apiClient.createUser(username);

    final sharedPrefs = SharedPreferencesClient();
    await sharedPrefs.saveUserInfo(user);

    return user;
  }

  Future<User> updateUser(int userId, String newUsername) async {
    final apiClient = ref.read(apiClientProvider);
    final updatedUser = await apiClient.updateUser(userId, newUsername);
    print(updatedUser);

    final sharedPrefs = SharedPreferencesClient();
    await sharedPrefs.saveUserInfo(updatedUser);

    return updatedUser;
  }

  /// 既存ユーザー情報の読み込み
  Future<User?> loadUser() async {
    final sharedPrefs = SharedPreferencesClient();
    return sharedPrefs.loadUserInfo();
  }
}

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:app/repository/api_client.dart';
import 'package:app/repository/shared_preferences_client.dart';
import 'package:app/model/user.dart';

part 'user_repository.g.dart';

@riverpod
UserRepository userRepository(UserRepositoryRef ref) => UserRepository(ref);

class UserRepository {
  UserRepository(this.ref);
  final UserRepositoryRef ref;

  /// 新規ユーザー作成&保存
  Future<User> createUser(String username) async {
    final apiClient = ref.read(apiClientProvider);
    final user = await apiClient.createUser(username);

    final sharedPrefs = SharedPreferencesClient();
    await sharedPrefs.saveUserInfo(user);

    return user;
  }

  /// 既存ユーザー情報の読み込み
  Future<User?> loadUser() async {
    final sharedPrefs = SharedPreferencesClient();
    return sharedPrefs.loadUserInfo();
  }
}

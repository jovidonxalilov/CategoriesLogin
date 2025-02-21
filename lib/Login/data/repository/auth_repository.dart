import '../../../core/client.dart';
import '../model/secure_storsge.dart';

class AuthRepository {
  AuthRepository({required this.client});

  final ApiClient client;

  Future<bool> login(String login, String password) async {
    final String? token = await client.login(login, password);

    if (token != null) {
      // Eski token va credentiallarni o‘chirib tashlamaymiz, avval yangi tokenni tekshiramiz
      await SecureStorage.saveCredentials(login: login, password: password);
      await SecureStorage.saveToken(token);
      return true;
    }
    return false;
  }

  Future<bool> retryLogin() async {
    final credentials = await SecureStorage.getCredentials();

    if (credentials == null) return false;

    final String? newToken = await client.login(credentials['login']!, credentials['password']!);

    if (newToken != null) {
      await SecureStorage.saveToken(newToken);
      return true;
    }
    return false;
  }
}

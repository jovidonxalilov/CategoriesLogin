import 'package:categorylogin/secure_storsge.dart';

import 'core/client.dart';

class AuthRepository {
  AuthRepository({required this.client});

  final ApiClient client;

  Future<void> login(String login, String password) async{
    final String token = await client.login(login, password);
    await SecureStorage.deleteToken(token);
    await SecureStorage.deleteCredentials();
    await SecureStorage.saveCredentials(login: login, password:  password);
    await SecureStorage.saveToken(token);
  }
}
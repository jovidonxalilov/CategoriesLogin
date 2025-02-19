import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio = Dio(BaseOptions(baseUrl: "http://10.10.2.143:8888/api/v1"));

  Future<String> login(String login, String password) async {
    var response = await dio.post(
      '/auth/login',
      data: {"login": login, "password": password},
    );
    if (response.statusCode == 200) {
      Map<String, String> data = Map<String, String>.from(response.data);
      return data['accessToken']!;
    } else {
      throw Exception("Login qilib bo'lmadi xattttooooooo");
    }
  }
}

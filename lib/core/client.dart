import 'package:dio/dio.dart';

import '../Login/data/model/secure_storsge.dart';

class ApiClient {
  final Dio dio = Dio(BaseOptions(baseUrl: "http://10.10.2.143:8888/api/v1"));

  Future<String?> login(String login, String password) async {
    var response = await dio.post(
      '/auth/login',
      data: {"login": login, "password": password},
    );

    if (response.statusCode == 200) {
      final data = Map<String, String>.from(response.data);
      return data['accessToken'];
    } else {
      return null;
    }
  }

  // Future<Response?> fetchCategories() async {
  //   String? token = await SecureStorage.getToken();
  //   if (token == null) return null;
  //
  //   try {
  //     return await dio.get(
  //       "/categories/list",
  //       options: Options(headers: {"Authorization": "Bearer $token"}),
  //     );
  //   } on DioException catch (e) {
  //     if (e.response?.statusCode == 401) {
  //       return null; // 401 bo'lsa, qayta login qilishga harakat qilamiz
  //     }
  //     throw e;
  //   }
  // }
  Future<List<dynamic>> fetchCategories() async {
    var response = await dio.get('/admin/categories/list');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data;
    }else{
      throw Exception("Malumot yoq");
    }
  }
}

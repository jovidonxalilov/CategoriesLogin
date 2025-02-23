import 'package:categorylogin/Login/data/model/SignUpModel.dart';
import 'package:dio/dio.dart';

import 'secure_storsge.dart';

class ApiClient {
  final Dio dio = Dio(BaseOptions(baseUrl: "http://10.10.2.180:8888/api/v1"));

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

  Future<bool> signUp(SignUpModel model) async {
    print("📤 Yuborilayotgan ma’lumot: ${model.toJson()}");

    try {
      var response = await dio.post(
        '/auth/register',
        data: model.toJson(),
      );

      print("📥 Server javobi (status code): ${response.statusCode}");
      print("📥 Server javobi (body): ${response.data}");

      if (response.statusCode == 201) {
        print("✅ Ro‘yxatdan o‘tish muvaffaqiyatli!");
        return true;
      } else {
        print("❌ Ro‘yxatdan o‘tishda xatolik!");
        return false;
      }
    } catch (e) {
      print("❌ API so‘rovda xatolik: $e");
      return false;
    }
  }


  Future<Response> fetchCategories() async {
    String? token = await SecureStorage.getToken();
    if (token == null) return fetchCategories();

    try {
      return await dio.get(
        "/categories/list",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return fetchCategories();
      }
      throw e;
    }
  }
// Future<List<dynamic>> fetchCategories() async {
//   var response = await dio.get('/admin/categories/list');
//   if (response.statusCode == 200) {
//     List<dynamic> data = response.data;
//     return data;
//   }else{
//     throw Exception("Malumot yoq");
//   }
// }
}

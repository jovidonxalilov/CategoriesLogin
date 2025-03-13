import 'dart:io';
import 'package:categorylogin/recipe_app/category_reviews/data/model/reviews_model.dart';
import 'package:dio/dio.dart';
import '../recipe_app/home_page/data/model/home_page_model.dart';
import '../recipe_app/sign_up/data/model/SignUpModel.dart';
import 'secure_storsge.dart';

class ApiClient {
  final Dio dio = Dio(BaseOptions(
    baseUrl: "http://192.168.10.2:8888/api/v1",
  ));

  Future<Map<String, dynamic>> fetchRecipeReviews(int recipeId) async {
    var response = await dio.get('/recipes/reviews/detail/$recipeId');
    if (response.statusCode == 200){
      return Map<String, dynamic>.from(response.data);
    } else{
      throw Exception("recipes/reviews/detail/$recipeId so'rovimiz xato ketti!");
    }
  }
  Future<List<dynamic>>fetchReviewsComment(int recipeId)async{
    var response=await dio.get('/reviews/list?recipe=$recipeId');
    print(' malumot ${response.data}');
    return response.statusCode==200?response.data:Exception("Ma'lumot kelmadi");
  }
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
    try {
      var response = await dio.post(
        '/auth/register',
        data: model.toJson(),
      );
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<Response> fetchMyAuthCategory() async {
    String? token = await SecureStorage.getToken();
    if (token == null) return fetchMyAuthCategory();
    try {
      return await dio.get(
        "/categories/list",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return fetchMyAuthCategory();
      }
      throw e;
    }
  }
  Future<List<HomePageModel>> fetchTrendingRecipe() async {
    var response = await dio.get('/recipes/trending-recipe');
    if (response.statusCode == 200) {
      if (response.data is Map<String, dynamic>) {
        var data = response.data;
        return [HomePageModel.fromJson(data)];
      } else if (response.data is List) {
        return response.data.map((e) => HomePageModel.fromJson(e)).toList();
      } else {
        throw Exception("❌ Noto‘g‘ri ma'lumot formati keldi!");
      }
    } else {
      throw Exception("❌ Ma'lumot kelmadi....");
    }
  }


  Future<List<dynamic>> fetchCategories() async {
    var response = await dio.get('/categories/list');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data;
    } else {
      throw Exception("/categories/list so'rovimiz o'xshamadi!");
    }
  }

  Future uploadProfilePhoto(File file) async {
    FormData formData = FormData.fromMap(
      {
        "profilePhoto": await MultipartFile.fromFile(file.path,
            filename: file.path.split('/').last),
      },
    );
    var response = await dio.post(
      'auth/upload',
      data: formData,
      options: Options(
        headers: {"Content - Type": "Multipart/form-data"},
      ),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<dynamic>> fetchRecipesCategory(int categoryId) async {
    var response = await dio.get('/recipes/list?Category=$categoryId');
    if (response.statusCode == 200) {
      return response.data as List<dynamic>;
    } else {
      throw Exception(
          "/recipes/list?Category=$categoryId So'rovimiz o'xshamadi");
    }
  }

  Future<dynamic> fetchRecipeById(int recipeId) async {
    var response = await dio.get('/recipes/detail/$recipeId');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('/recipes/detail/$recipeId malumot kelmadi');
    }
  }

  Future<List<dynamic>> fetchCommunity(int limit, String order, bool descending) async {
    try {
      var response = await dio.get('/recipes/community/list?Limit=$limit&Order=$order&Descending=$descending');
      List<dynamic> data = response.data;
      return data;
    } catch (e) {
      return [];
    }
  }
  Future<List<dynamic>> fetchRecipeTopChefs() async {
    var response = await dio.get('/auth/top-chefs');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('/auth/top-chefs malumot kelmadi');
    }
  }

}

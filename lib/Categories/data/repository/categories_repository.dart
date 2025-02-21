
import '../../../core/client.dart';
import '../models/category_model.dart';

class CategoriesRepository {
  CategoriesRepository({
    required this.client
});

  final ApiClient client;

  List<CategoriesModel>? myCategory;

  Future<List<CategoriesModel>?> fetchCategories() async {
    print("qandaydir");
    var rawProfile = await client.fetchCategories();
    print("raprofile $rawProfile");
    myCategory = rawProfile.map((e)=>CategoriesModel.fromJson(e)).toList();
    return myCategory;
  }
}
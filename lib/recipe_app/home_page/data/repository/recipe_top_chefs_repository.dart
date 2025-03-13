import 'package:categorylogin/recipe_app/home_page/data/model/recipe_top_chefs_model.dart';

import '../../../../core/client.dart';

class TopChefsRepository {
  TopChefsRepository({required this.client});

  final ApiClient client;
  List<TopChefsModel> categories = [];

  Future<List<TopChefsModel>> fetchTopChefs() async {
    final rawCategories = await client.fetchRecipeTopChefs();
    categories = rawCategories
        .map((category) => TopChefsModel.fromJson(category))
        .toList();
    return categories;
  }
}
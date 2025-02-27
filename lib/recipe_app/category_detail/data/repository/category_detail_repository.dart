import 'package:categorylogin/core/client.dart';
import '../../../recipe_detail/data/model/detail_model.dart';
import '../model/recipe_model.dart';
class CategoryDetailRepository {
  CategoryDetailRepository({required this.client});
  final ApiClient client;
  Map<int, List<RecipeModel>> recipeByCategory = {};
  RecipeDetailModel? recipe;

  Future<List<RecipeModel>> fetchRecipesCategory(int categoryId) async {
    if (recipeByCategory.containsKey(categoryId) && recipeByCategory[categoryId] != null){
      return recipeByCategory[categoryId]!;
    }
    var rawCategory = await client.fetchRecipesCategory(categoryId);
    final category = rawCategory.map((categories) => RecipeModel.fromJson(categories)).toList();
    recipeByCategory[categoryId] = category;
    return category;
  }
  Future<RecipeDetailModel> fetchRecipeById(int recipeId)  async {
    final rawCategories = await client.fetchRecipeById(recipeId);
    recipe = RecipeDetailModel.fromJson(rawCategories);
    return recipe!;
  }
}
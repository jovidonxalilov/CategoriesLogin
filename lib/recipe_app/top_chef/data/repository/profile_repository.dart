import '../../../../core/client.dart';
import '../../../category_detail/data/model/recipe_model.dart';
import '../model/profile_model.dart';

class ProfileRepository{
  final ApiClient client;
  ProfileRepository({required this.client});

  Map<int, List<RecipeModel>> recipeByCategory = {};
  ProfileModel? aboutUser;

  Future<ProfileModel>fetchUserInfo()async{
    var  rawUser= await client.genericGetRequest("/auth/details/2");
    aboutUser=ProfileModel.fromJson(rawUser);
    return aboutUser!;
  }

  Future<List<RecipeModel>> fetchProfileRecipes(int categoryId) async {
    if (recipeByCategory.containsKey(categoryId) && recipeByCategory[categoryId] != null){
      return recipeByCategory[categoryId]!;
    }
    var rawCategory = await client.fetchRecipesCategory(categoryId);
    final category = rawCategory.map((categories) => RecipeModel.fromJson(categories)).toList();
    recipeByCategory[categoryId] = category;
    return category;
  }

}
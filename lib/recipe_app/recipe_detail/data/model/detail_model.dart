import 'package:categorylogin/recipe_app/recipe_detail/data/model/recipe_ingredients_model.dart';
import 'package:categorylogin/recipe_app/recipe_detail/data/model/recipe_instructions_model.dart';
import 'detail_model_in_user.dart';

class RecipeDetailModel {
  final int id;
  final int categoryId;
  final String photo, title, description, videoRecipe;
  final int timeRequired;
  final num rating;
  final DetailModelUser user;
  final List<RecipeIngredientsModel> ingredients;
  final List<RecipeInstructionsModel> instructions;

  RecipeDetailModel({
    required this.id,
    required this.categoryId,
    required this.photo,
    required this.title,
    required this.ingredients,
    required this.instructions,
    required this.description,
    required this.videoRecipe,
    required this.timeRequired,
    required this.rating,
    required this.user,
  });

  factory RecipeDetailModel.fromJson(Map<String, dynamic> json) {
    return RecipeDetailModel(
      id: json['id'],
      categoryId: json['categoryId'],
      photo: json['photo'],
      title: json['title'],
      description: json['description'],
      videoRecipe: json['videoRecipe'],
      timeRequired: json['timeRequired'],
      rating: json['rating'],
      user: DetailModelUser.fromJson(json['user']),
      instructions: (json['instructions'] as List<dynamic>).map((instructions)=> RecipeInstructionsModel.fromJson(instructions)).toList(),
      ingredients: (json['ingredients'] as List<dynamic>).map((ingredients)=> RecipeIngredientsModel.fromJson(ingredients)).toList(),
    );
  }
}

import 'package:categorylogin/core/client.dart';
import 'package:categorylogin/recipe_app/trending_recipe/data/model/trending_recipes_model.dart';
import 'package:flutter/material.dart';

import '../../../home_page/data/model/home_page_model.dart';

class TrendingRecipesRepository extends ChangeNotifier {
  TrendingRecipesRepository({required this.client});
  final ApiClient client;
  List<TrendingRecipesModel> recipes = [];
  HomePageModel? categories;

  Future<List<TrendingRecipesModel>> fetchTrendingRecipes( ) async {
    if (recipes.isNotEmpty) return recipes;
    var rawRecipe = await client.fetchTrendingRecipes();
    recipes = rawRecipe
    .map((recipe) => TrendingRecipesModel.fromJson(recipe)).toList();
    return recipes;
  }

  Future<HomePageModel> fetchTrendingRecipe() async {
    if (categories!=null) return categories!;
    final rawCategories = await client.fetchTrendingRecipe();
    categories = HomePageModel.fromJson(rawCategories);
    return categories!;
  }
}
import 'dart:io';

import 'package:categorylogin/recipe_app/category_detail/data/model/recipe_model.dart';
import 'package:categorylogin/recipe_app/category_detail/data/repository/category_detail_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:categorylogin/recipe_app/categories/data/models/category_model.dart';
import 'package:categorylogin/recipe_app/categories/data/repository/categories_repository.dart';
import 'package:categorylogin/recipe_app/home_page/data/model/home_page_model.dart';
import 'package:categorylogin/recipe_app/home_page/data/repository/home_page_repository.dart';

class HomePageViewModel extends ChangeNotifier {
  HomePageViewModel({
    required HomePageRepository catRepo,
    required CategoryRepository repo,
    required CategoryDetailRepository recipeRepo,
  })
      : _catRepo = catRepo,
        _recipeRepo = recipeRepo,
        _repo = repo {
    load();
  }

  final HomePageRepository _catRepo;
  final CategoryRepository _repo;
  final CategoryDetailRepository _recipeRepo;

  List<RecipeModel> detail = [];
  List<HomePageModel> recipes = [];
  List<CategoryModel> categories = [];
  HomePageModel? mainCategory;
  RecipeModel? recipeDetail;
  bool isLoading = true;

  Future<void> load() async {
    isLoading = true;
    notifyListeners();

    var fetchedRecipes = await _catRepo.fetchTrendingRecipe();
    var fetchedCategories = await _repo.fetchCategories();

    if (fetchedRecipes.isNotEmpty) {
      recipes = fetchedRecipes;
      mainCategory = recipes.first;
    }

    if (fetchedCategories.isNotEmpty) {
      categories = fetchedCategories;
    }

    isLoading = false;
    notifyListeners();
  }
  bool right = true;
  late CategoryModel _selected;
  CategoryModel get selected => _selected;
  set selected(CategoryModel model) {
    if (categories.indexOf(_selected) < categories.indexOf(model)) {
      right = true;
    } else {
      right = false;
    }
    notifyListeners();

    _selected = model;

    notifyListeners();
    fetchRecipesByCategory(_selected.id);
  }
  Future<void> fetchRecipesByCategory(int categoryId) async {
    try {
      recipeDetail = null;
      notifyListeners();
      final fetchedRecipes = await _recipeRepo.fetchRecipesCategory(categoryId);
      if (fetchedRecipes.isNotEmpty) {
        detail = fetchedRecipes.cast<RecipeModel>();
      } else {
        detail = [];
        recipeDetail = null;
      }
    } catch (e) {
      debugPrint("Error fetching recipes: $e");
      recipeDetail = null;
    }
    notifyListeners();
  }



}
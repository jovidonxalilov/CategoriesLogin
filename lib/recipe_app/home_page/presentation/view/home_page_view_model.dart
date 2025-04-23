import 'dart:io';

import 'package:categorylogin/recipe_app/category_detail/data/model/recipe_model.dart';
import 'package:categorylogin/recipe_app/category_detail/data/repository/category_detail_repository.dart';
import 'package:categorylogin/recipe_app/home_page/data/model/recipe_top_chefs_model.dart';
import 'package:categorylogin/recipe_app/home_page/data/repository/recipe_top_chefs_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:categorylogin/recipe_app/categories/data/models/category_model.dart';
import 'package:categorylogin/recipe_app/categories/data/repository/categories_repository.dart';
import 'package:categorylogin/recipe_app/home_page/data/model/home_page_model.dart';
import 'package:categorylogin/recipe_app/home_page/data/repository/home_page_repository.dart';

class HomePageViewModel extends ChangeNotifier {
  HomePageViewModel(
      {required HomePageRepository catRepo,
      required CategoryRepository repo,
      required CategoryDetailRepository recipeRepo,
      required TopChefsRepository chefs})
      : _catRepo = catRepo,
        _recipeRepo = recipeRepo,
        _repo = repo,
        _chefs = chefs {
    load();
  }

  final HomePageRepository _catRepo;
  final CategoryRepository _repo;
  final CategoryDetailRepository _recipeRepo;
  final TopChefsRepository _chefs;

  List<RecipeModel> detail = [];
  // List<HomePageModel> recipes = [];
  List<CategoryModel> categories = [];
  List<TopChefsModel> chefs = [];
  HomePageModel? mainCategory;
  RecipeModel? recipeDetail;
  TopChefsModel? recipeChefs;
  bool isLoading = true;
  bool right = true;
  CategoryModel? _selected;

  CategoryModel? get selected => _selected;

  set selected(CategoryModel? model) {
    if (model != null && _selected != null) {
      right = categories.indexOf(_selected!) < categories.indexOf(model);
    }
    _selected = model;
    notifyListeners();
  }

  Future<void> load() async {
    isLoading = true;
    notifyListeners();
    try {
      final fetchedRecipes = await _catRepo.fetchTrendingRecipe();
      final fetchedCategories = await _repo.fetchCategories();
      final fetchedTopChefs = await _chefs.fetchTopChefs();

      // // ✅ Asosiy kategoriya ma'lumotlarini to'g'ri ishlash
      // if (fetchedRecipes.isNotEmpty) {
      //   mainCategory = fetchedRecipes.first;
      // } else {
      //   throw Exception("fetchTrendingRecipe bo'sh ma'lumot qaytardi!");
      // }

      if (fetchedTopChefs.isNotEmpty) {
        chefs = fetchedTopChefs;
        recipeChefs = chefs.first;
      }

      if (fetchedCategories.isNotEmpty) {
        categories = fetchedCategories;
        _selected ??= categories.first;
      }

      if (categories.isNotEmpty) {
        final fetchedRecipesCategory =
        await _recipeRepo.fetchRecipesCategory(categories.first.id);
        if (fetchedRecipesCategory.isNotEmpty) {
          detail = fetchedRecipesCategory;
          recipeDetail = detail.first;
        }
      }
    } catch (e) {
      print("Xatolik yuz berdi: $e");
    }

    isLoading = false;
    notifyListeners();
  }

}

/*
ApiCLientdagi metodlarni nomini to'g'irlash
repositorydagi metodlani nominiyam to'g'irlash kerak
view model ichidagi o'zgaruvchilani nomini to'g'irlab chiqish kerak
o'zgaruvchilani typeniyam to'g'irlab chiqish kerak

 */

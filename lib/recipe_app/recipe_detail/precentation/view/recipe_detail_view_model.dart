import 'package:flutter/material.dart';

import '../../../category_detail/data/repository/category_detail_repository.dart';
import '../../data/model/detail_model.dart';
import '../../data/repository/detail_repository.dart';

class RecipeDetailViewModel extends ChangeNotifier {
  RecipeDetailViewModel({
    required CategoryDetailRepository recipeRepo,
    required this.recipeId,
  }) : _recipeRepo = recipeRepo {
    load();
  }

  final CategoryDetailRepository _recipeRepo;
  bool isLoading = true;
  final int recipeId;

  late final RecipeDetailModel recipe;

  Future<void> load() async {
    isLoading = true;
    notifyListeners();
    recipe = await _recipeRepo.fetchRecipeById(recipeId);
    isLoading = false;
    notifyListeners();
  }
}

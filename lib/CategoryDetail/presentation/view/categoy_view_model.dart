import 'package:categorylogin/Categories/data/models/category_model.dart';
import 'package:categorylogin/Categories/data/repository/categories_repository.dart';
import 'package:flutter/cupertino.dart';

import '../../../Features/data/repository/detail_repository.dart';
import '../../data/model/recipe_model.dart';

class CategoryDetailViewModel with ChangeNotifier {
  CategoryDetailViewModel({
    required CategoriesRepository catRepo,
    required RecipeRepository recipeRepo,
  })  : _catRepo = catRepo,
        _recipeRepo = recipeRepo;
  final CategoriesRepository _catRepo;
  final RecipeRepository _recipeRepo;
  List<CategoriesModel> categories = [];
  List<RecipeModel> recipes = [];

  late CategoriesModel _selected;

  CategoriesModel get selected => _selected;

  set selected(CategoriesModel model) {
    notifyListeners();
  }

  Future<void> load() async {
    categories = await _catRepo.fetchMyCategory();
    selected = categories.first;
    recipes = await _recipeRepo.fetchRecipesByCategory( selected.id);
    notifyListeners();
  }
}
// import 'package:flutter/cupertino.dart';
// import 'package:categorylogin/Categories/data/models/category_model.dart';
// import 'package:categorylogin/Categories/data/repository/categories_repository.dart';
// import '../../data/model/recipe_model.dart';
// import '../../data/repository/recipe_repository.dart';
//
// class CategoryDetailViewModel with ChangeNotifier {
//   final CategoriesRepository _catRepo;
//   final RecipeRepository _recipeRepo;
//
//   List<CategoriesModel> categories = [];
//   List<RecipeModel> recipes = [];
//
//   CategoriesModel? _selected;
//   CategoriesModel? get selected => _selected;
//
//   set selected(CategoriesModel? model) {
//     if (_selected != model) {
//       _selected = model;
//       _loadRecipes();
//       notifyListeners();
//     }
//   }
//
//   CategoryDetailViewModel({
//     required CategoriesRepository catRepo,
//     required RecipeRepository recipeRepo,
//   })  : _catRepo = catRepo,
//         _recipeRepo = recipeRepo {
//     load();
//   }
//
//   Future<void> load() async {
//     try {
//       categories = await _catRepo.fetchMyCategory() ?? [];
//
//       if (categories.isNotEmpty) {
//         _selected = categories.first;
//         await _loadRecipes();
//       } else {
//         recipes = [];
//       }
//
//       notifyListeners();
//     } catch (e) {
//       print("Xatolik yuz berdi: $e");
//       categories = [];
//       recipes = [];
//       notifyListeners();
//     }
//   }
//
//   Future<void> _loadRecipes() async {
//     try {
//       if (_selected != null) {
//         recipes = await _recipeRepo.fetchRecipesCategory(_selected!.id) ?? [];
//       } else {
//         recipes = [];
//       }
//     } catch (e) {
//       print("Retseptlarni yuklashda xatolik: $e");
//       recipes = [];
//     }
//   }
// }

import 'package:flutter/cupertino.dart';
import '../../../categories/data/models/category_model.dart';
import '../../../categories/data/repository/categories_repository.dart';
import '../../../category_detail/data/model/recipe_model.dart';
import '../../../category_detail/data/repository/category_detail_repository.dart';


class HomePageViewModel with ChangeNotifier{
  HomePageViewModel({
    required CategoryRepository catRepo,
    required CategoryDetailRepository recipeRepo,
    required CategoryModel selected,
  })  : _catRepo = catRepo,
        _recipeRepo = recipeRepo,
        _selected = selected;

  final CategoryRepository _catRepo;
  final CategoryDetailRepository _recipeRepo;

  List<CategoryModel?> categories = [];
  List<RecipeModel> recipes = [];
  bool right = true;
  bool isLoading = true;
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
    recipes = await _recipeRepo.fetchRecipesCategory(categoryId);
    notifyListeners();
  }
  Future<void> load() async {
    isLoading = true;
    notifyListeners();
    categories = await _catRepo.fetchCategories();
    recipes = await _recipeRepo.fetchRecipesCategory(selected.id);
    isLoading = false;
    notifyListeners();
  }
}
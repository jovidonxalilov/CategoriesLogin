import 'package:flutter/cupertino.dart';
import '../../../categories/data/models/category_model.dart';
import '../../../categories/data/repository/categories_repository.dart';


class HomePageViewModel extends ChangeNotifier {
  HomePageViewModel({required CategoryRepository catRepo}) : _catRepo = catRepo {
    load();
  }

  final CategoryRepository _catRepo;

  List<CategoryModel> categories = [];
  CategoryModel? mainCategory;

  Future<void> load() async {
    final allCategories = await _catRepo.fetchCategories();
    mainCategory = allCategories.firstWhere((category) => category.main);
    categories = allCategories.where((category)=> !category.main).toList();
    notifyListeners();
  }
}
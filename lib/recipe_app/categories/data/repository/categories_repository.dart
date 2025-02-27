import 'package:categorylogin/core/client.dart';

import '../models/category_model.dart';


class CategoryRepository {
  CategoryRepository({required this.client});

  final ApiClient client;
  List<CategoryModelId> categories = [];

  Future<List<CategoryModelId>> fetchCategories() async {
    final rawCategories = await client.fetchCategories();
    categories = rawCategories
        .map((category) => CategoryModelId.fromJson(category))
        .toList();
    return categories;
  }
}

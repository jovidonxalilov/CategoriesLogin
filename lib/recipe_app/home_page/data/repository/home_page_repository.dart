import 'package:categorylogin/recipe_app/home_page/data/model/home_page_model.dart';

import '../../../../core/client.dart';

class HomePageRepository {
  HomePageRepository({required this.client});

  final ApiClient client;
  List<HomePageModel> categories = [];

  Future<List<HomePageModel>> fetchTrendingRecipe() async {
    final rawCategories = await client.fetchTrendingRecipe();
    categories = rawCategories;
    return categories;
  }
}
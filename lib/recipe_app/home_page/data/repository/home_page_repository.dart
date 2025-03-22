import 'package:categorylogin/recipe_app/home_page/data/model/home_page_model.dart';

import '../../../../core/client.dart';

class HomePageRepository {
  HomePageRepository({required this.client});

  final ApiClient client;
  HomePageModel? categories;

  Future<HomePageModel> fetchTrendingRecipe() async {
    if (categories!=null) return categories!;
    final rawCategories = await client.fetchTrendingRecipe();
    categories = HomePageModel.fromJson(rawCategories);
    return categories!;
  }
}
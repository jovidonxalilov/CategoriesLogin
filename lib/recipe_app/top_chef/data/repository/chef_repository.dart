import 'package:categorylogin/core/client.dart';
import 'package:categorylogin/recipe_app/home_page/data/model/recipe_top_chefs_model.dart';
import 'package:categorylogin/recipe_app/top_chef/data/model/chef_model.dart';

class ChefRepository {
  ChefRepository({required this.client});

  final ApiClient client;
  // List<TopChefModelSmall> topChefsHomePage = [];
  List<TopChefsModel> mostViewedChefs = [];
  List<TopChefsModel> mostLikedChefs = [];
  List<TopChefsModel> newChefs = [];

  Future<List<TopChefsModel>> fetchMostViewedChefs() async {
    var rawMostViewedChefs = await client.genericGetRequest<List<dynamic>>(
      '/top-chefs/list', queryParams: {"Order": "Date", "Limit": 2, "Descending": false},
    );
    mostViewedChefs = rawMostViewedChefs.map((chef) => TopChefModel.fromJson(chef)).cast<TopChefsModel>().toList();
    return mostViewedChefs;
  }
  Future<List<TopChefsModel>> fetchMostLikedChefs() async {
    var rawMostLikViewedChefs = await client.genericGetRequest<List<dynamic>>(
      '/top-chefs/list', queryParams: {"Limit": 2},
    );
    mostLikedChefs = rawMostLikViewedChefs.map((chef) => TopChefModel.fromJson(chef)).cast<TopChefsModel>().toList();
    return mostLikedChefs;
  }
  Future<List<TopChefsModel>> fetchNewChefs() async {
    var rawNewChefs = await client.genericGetRequest<List<dynamic>>(
      '/top-chefs/list', queryParams: {"Order": "Date", "Limit": 2},
    );
    newChefs = rawNewChefs.map((chef) => TopChefModel.fromJson(chef)).cast<TopChefsModel>().toList();
    return newChefs;
  }

}
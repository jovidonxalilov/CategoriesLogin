import 'package:categorylogin/core/client.dart';
import 'package:categorylogin/recipe_app/top_chef/data/model/chef_model.dart';

class ChefRepository {
  ChefRepository({required this.client});

  final ApiClient client;

  List<TopChefModel> topChefsHomePage = [];

  List<TopChefModel> mostViewedChefs = [];
  List<TopChefModel> mostLikedChefs = [];
  List<TopChefModel> newChefs = [];

  Future<List<TopChefModel>> fetchTopChefsForHome({int? limit}) async {
    var rawChefs = await client.fetchTopChefsForHome(limit: limit);
    topChefsHomePage = rawChefs.map((chef) => TopChefModel.fromJson(chef)).toList();
    return topChefsHomePage;
  }

  Future<List<TopChefModel>> fetchMostViewedChefs() async {
    var rawMostViewedChefs = await client.genericGetRequest<List<dynamic>>(
      '/top-chefs/list',
      queryParams: {"Order": "Views", "Limit": 2, "Descending": false, "Page": 1},
    );
    mostViewedChefs = rawMostViewedChefs.map((chef) => TopChefModel.fromJson(chef)).toList();
    return mostViewedChefs;
  }

  Future<List<TopChefModel>> fetchMostLikedChefs() async {
    var rawMostLikedChefs = await client.genericGetRequest<List<dynamic>>(
      '/top-chefs/list',
      queryParams: {"Order": "Likes", "Limit": 2, "Descending": false, "Page": 2},
    );
    mostLikedChefs = rawMostLikedChefs.map((chef) => TopChefModel.fromJson(chef)).toList();
    return mostLikedChefs;
  }

  Future<List<TopChefModel>> fetchNewChefs() async {
    var rawNewChefs = await client.genericGetRequest<List<dynamic>>(
      '/top-chefs/list',
      queryParams: {"Order": "Date", "Limit": 2, "Descending": false, "Page": 3},
    );
    newChefs = rawNewChefs.map((chef) => TopChefModel.fromJson(chef)).toList();
    return newChefs;
  }
}

import 'package:categorylogin/recipe_app/community/data/model/community_model.dart';
import 'package:categorylogin/recipe_app/community/data/model/community_user_model.dart';

import '../../../../core/client.dart';

class CommunityRepository {
  CommunityRepository({required this.client});

  final ApiClient client;
  List<CommunityModel>? community = [];

  Future<List<CommunityModel>> fetchCommunity(int limit, String order, bool descending) async {
    if (community!.isNotEmpty){
      return community!;
    }else{
      var rawCommunity=await client.fetchCommunity(limit, order, descending);
      community=rawCommunity.map((e)=>CommunityModel.fromJson(e)).toList();
      return community!;
    }
  }


}
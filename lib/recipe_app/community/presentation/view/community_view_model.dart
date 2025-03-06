import 'package:categorylogin/recipe_app/community/data/model/community_model.dart';
import 'package:categorylogin/recipe_app/community/data/repository/community_repository.dart';
import 'package:flutter/cupertino.dart';


class CommunityViewModel extends ChangeNotifier {
  CommunityViewModel({
    required this.limit,
    required this.order,
    required this.descending,
    required CommunityRepository communityRepo,
  }) : _communityRepo = communityRepo{load();}

  final CommunityRepository _communityRepo;
  bool isLoading = true;

  final int limit;
  final String order;
  bool descending = true;

  List<CommunityModel> community = [];

  Future<void> load() async {
    isLoading = true;
    notifyListeners();

    community = await _communityRepo.fetchCommunity(limit, order, descending);

    isLoading = false;
    notifyListeners();
  }
}

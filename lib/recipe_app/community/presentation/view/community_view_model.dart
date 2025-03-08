import 'package:flutter/cupertino.dart';

import '../../data/model/community_model.dart';
import '../../data/repository/community_repository.dart';

class CommunityViewModel extends ChangeNotifier {
  CommunityViewModel({
    required this.limit,
    required this.order,
    required this.descending,
    required CommunityRepository communityRepo,
  }) : _communityRepo = communityRepo {
    load();
  }

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

  int selectedTabIndex = 0;

  void updateTabIndex(int index) {
    selectedTabIndex = index;
    notifyListeners();
  }

  List<CommunityModel> getFilteredCommunity(String category) {
    switch (category) {
      case "top_recipes":
        return community.where((post) => post.rating >= 5).toList();
      case "oldest":
        return community.where((post) => post.rating < 5).toList();
      default:
        return community;
    }

  }
}

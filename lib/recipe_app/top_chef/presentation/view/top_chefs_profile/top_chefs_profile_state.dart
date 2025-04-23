import 'package:equatable/equatable.dart';

import '../../../../category_detail/data/model/recipe_model.dart';
import '../../../data/model/profile_model.dart';

enum TopChefsProfileStatus { idle, loading, success, error }

class TopChefsProfileState extends Equatable {
  final List<RecipeModel> recipes;
  final ProfileModel? userInfo;
  final TopChefsProfileStatus status;

  const TopChefsProfileState({
    required this.recipes,
    required this.userInfo,
    required this.status,
  });

  factory TopChefsProfileState.initial() {
    return TopChefsProfileState(
      recipes: [],
      userInfo: null,
      status: TopChefsProfileStatus.idle,
    );
  }

  TopChefsProfileState copyWith({
    List<RecipeModel>? recipe,
    ProfileModel? profile,
    TopChefsProfileStatus? status,
  }) {
    return TopChefsProfileState(
      recipes: recipe??this.recipes,
      userInfo: profile ??this.userInfo,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [recipes, userInfo, status];
}

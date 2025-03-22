import 'package:categorylogin/recipe_app/home_page/data/model/home_page_model.dart';
import 'package:categorylogin/recipe_app/trending_recipe/data/model/trending_recipes_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

enum TrendingRecipesStatus { idle, loading, error }

@immutable
class TrendingRecipesState extends Equatable {
  final TrendingRecipesStatus status;
  final List<TrendingRecipesModel>? recipesModel;
  final  HomePageModel? recipeModel;

  const TrendingRecipesState({
    required this.status,
    required this.recipesModel,
    required this.recipeModel,
  });

  TrendingRecipesState copyWith({
    TrendingRecipesStatus? status,
    List<TrendingRecipesModel>? recipesModel,
    HomePageModel? recipeModel,
  }) {
    return TrendingRecipesState(
      status: status ?? this.status,
      recipesModel: recipesModel ?? this.recipesModel,
      recipeModel: recipeModel ?? this.recipeModel,
    );
  }
  @override
  List<Object?> get props => [status, recipesModel, recipeModel];
}

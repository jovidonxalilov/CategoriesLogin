import 'dart:io';

import 'package:categorylogin/core/client.dart';
import 'package:categorylogin/recipe_app/create_reviews/data/model/create_reviews_model.dart';

import '../../../category_reviews/data/model/reviews_model.dart';
import '../model/recipe_create_review_model.dart';
import '../model/reviews_model.dart';

class CreateReviewsRepository {
  CreateReviewsRepository({required this.client});

  final ApiClient client;

  Future<bool> createReview({
    required int recipeId,
    required int rating,
    required String comment,
    required bool recommend,
    File? photo,
  }) async {
    final reviewModel = CreateReviewsModel(
      comment: comment,
      rating: rating,
      photo: photo,
      recipeId: recipeId,
      recommend: recommend,
    );
    final result = await client.createReviews(reviewModel);
    return result;
  }
  Future<List<ReviewRecipeModel>> fetchReviewsByRecipe(int recipeId) async {
    final rawReviews = await client.genericGetRequest<List<dynamic>>('/reviews/list?recipeId=$recipeId');
    return rawReviews.map((review) => ReviewRecipeModel.fromJson(review)).toList();
  }
  Future<RecipeCreateReviewModel> fetchRecipeForCreateReview(int recipeId) async {
    var rawRecipe = await client.genericGetRequest<dynamic>('/recipes/create-review/$recipeId');
    return RecipeCreateReviewModel.fromJson(rawRecipe);
  }
}

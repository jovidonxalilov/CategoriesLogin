import 'package:categorylogin/recipe_app/category_reviews/data/model/reviews_model.dart';

import '../../../../core/client.dart';
import '../model/reviews_comment_model.dart';

class ReviewsRepository {
  final ApiClient client;

  ReviewsRepository({
    required this.client,
  });

  ReviewsModel? reviews;
  List<ReviewsCommentsModel> reviewComment = [];

  Future<ReviewsModel> fetchReviews(int recipeId) async {
    if (reviews!=null) return reviews!;
    var rawReview = await client.fetchRecipeReviews(recipeId);
    reviews=ReviewsModel.fromJson(rawReview);
    return reviews!;
  }

  Future<List<ReviewsCommentsModel>> fetchReviewComment(int recipeId) async {
    if (reviewComment.isNotEmpty) return reviewComment;
    var rawComments = await client.fetchReviewsComment(recipeId);
    reviewComment = rawComments.map((e) => ReviewsCommentsModel.fromJson(e)).toList();
    return reviewComment;  }
}

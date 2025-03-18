
import 'package:categorylogin/recipe_app/create_reviews/data/model/reviews_user__recipe_model.dart';

class ReviewRecipeModel {
  final int id;
  final String comment;
  final int rating;
  final UserInReviewModel user;
  final DateTime created;

  ReviewRecipeModel({
    required this.id,
    required this.comment,
    required this.rating,
    required this.user,
    required this.created,
  });

  factory ReviewRecipeModel.fromJson(Map<String, dynamic> json) {
    return ReviewRecipeModel(
      id: json['id'],
      comment: json['comment'],
      rating: json['rating'],
      user: UserInReviewModel.fromJson(json['user']),
      created: DateTime.parse(json['created']),
    );
  }
}

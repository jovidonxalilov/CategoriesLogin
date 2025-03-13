import 'package:categorylogin/recipe_app/category_reviews/data/model/reviews_comment_user_model.dart';

class ReviewsCommentsModel {
  final int id;
  final String comment, image;
  final DateTime created;
  final num rating;
  final ReviewsCommentUserModel user;

  ReviewsCommentsModel({
    required this.id,
    required this.user,
    required this.rating,
    required this.image,
    required this.created,
    required this.comment,
  });

  factory ReviewsCommentsModel.fromJson(Map<String, dynamic> json) {
    return ReviewsCommentsModel(
      id: json['id'],
      user: ReviewsCommentUserModel.fromJson(json['user']),
      rating: json['rating'],
      image: json['image'],
      created: DateTime.parse(json['created']),
      comment: json['comment'],
    );
  }
}

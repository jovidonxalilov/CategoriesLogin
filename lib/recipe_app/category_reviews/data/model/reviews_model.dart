import 'package:categorylogin/recipe_app/category_reviews/data/model/reviews_user_model.dart';

class ReviewsModel {
  final int id;
  final String title, photo;
  final num rating;
  final int reviewsCount;
  final ReviewsUserModel user;

  ReviewsModel({
    required this.photo,
    required this.id,
    required this.title,
    required this.rating,
    required this.user,
    required this.reviewsCount,
  });

  factory ReviewsModel.fromJson(Map<String, dynamic> json) {
    return ReviewsModel(
      photo: json['photo'],
      id: json['id'],
      title: json['title'],
      rating: json['rating'],
      user: ReviewsUserModel.fromJson(json['user']),
      reviewsCount: json['reviewsCount'],
    );
  }
}

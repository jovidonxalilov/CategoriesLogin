import 'package:categorylogin/recipe_app/community/data/model/community_user_model.dart';

class CommunityModel {
  final int id;
  final String title, description;
  final String photo;
  final num timeRequired, rating, reviewCount;
  final String created;
  final CommunityUserModel user;

  CommunityModel({
    required this.id,
    required this.title,
    required this.description,
    required this.photo,
    required this.timeRequired,
    required this.rating,
    required this.reviewCount,
    required this.created,
    required this.user,
  });

  factory CommunityModel.fromJson(Map<String, dynamic> json){
    return CommunityModel(id: json['id'],
        title: json['title'],
        description: json['description'],
        photo: json['photo'],
        timeRequired: json['timeRequired'] ?? 0,
        rating: (json['rating'] as num).toDouble(),
        reviewCount: json['reviewCount'] ?? 0,
        created: json['created'],
        user: CommunityUserModel.fromJson(json['user']),
    );
  }
}

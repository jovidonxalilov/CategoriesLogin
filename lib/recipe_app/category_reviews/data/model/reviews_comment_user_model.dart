class ReviewsCommentUserModel {
  final int id;
  final String profilePhoto, username;

  ReviewsCommentUserModel({
    required this.id,
    required this.profilePhoto,
    required this.username,
  });

  factory ReviewsCommentUserModel.fromJson(Map<String, dynamic> json) {
    return ReviewsCommentUserModel(
      id: json['id'],
      profilePhoto: json['profilePhoto'],
      username: json['username'],
    );
  }
}

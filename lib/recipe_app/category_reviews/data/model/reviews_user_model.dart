class ReviewsUserModel {
  final int id;
  final String profilePhoto, username, firstName, lastName;

  ReviewsUserModel({
    required this.id,
    required this.profilePhoto,
    required this.firstName,
    required this.lastName,
    required this.username,
  });

  factory ReviewsUserModel.fromJson(Map<String, dynamic> json) {
    return ReviewsUserModel(
      id: json['id'],
      profilePhoto: json['profilePhoto'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      username: json['username'],
    );
  }
}

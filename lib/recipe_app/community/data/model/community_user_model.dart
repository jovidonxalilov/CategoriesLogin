class CommunityUserModel {
  final int id;
  final String profilePhoto;
  final String username, firstName, lastName;

  CommunityUserModel({
    required this.id,
    required this.profilePhoto,
    required this.username,
    required this.firstName,
    required this.lastName,
  });

  factory CommunityUserModel.fromJson(Map<String, dynamic> json) {
    return CommunityUserModel(
      id: json['id'],
      profilePhoto: json['profilePhoto'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
}

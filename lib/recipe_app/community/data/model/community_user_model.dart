class CommunityUserModel {
  final int id;
  final String profilePhoto;
  final String userName, firstName, lastName;

  CommunityUserModel({
    required this.id,
    required this.profilePhoto,
    required this.userName,
    required this.firstName,
    required this.lastName,
  });

  factory CommunityUserModel.fromJson(Map<String, dynamic> json) {
    return CommunityUserModel(
      id: json['id'],
      profilePhoto: json['profilePhoto'],
      userName: json['userName'].toString(),
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
}

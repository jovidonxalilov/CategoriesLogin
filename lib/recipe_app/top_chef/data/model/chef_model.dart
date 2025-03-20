class TopChefModel {
  final int id;
  final String username;
  final String firstName, lastName;
  final String profilePhoto;

  TopChefModel({
    required this.profilePhoto,
    required this.username,
    required this.lastName,
    required this.id,
    required this.firstName,
  });

  factory TopChefModel.fromJson(Map<String, dynamic> json) {
    return TopChefModel(
      profilePhoto: json['photo'],
      username: json['username'],
      lastName: json['lastName'],
      id: json['id'],
      firstName: json['firstName'],
    );
  }
}

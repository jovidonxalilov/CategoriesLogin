class DetailModelUser {
  final int id;
  final String username, profilePhoto, firstName, lastName;

  DetailModelUser({
    required this.id,
    required this.username,
    required this.profilePhoto,
    required this.firstName,
    required this.lastName,
  });

  factory DetailModelUser.fromJson(Map<String, dynamic> json) {
    return DetailModelUser(
      id: json['id'],
      username: json['username'],
      profilePhoto: json['profilePhoto'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
}

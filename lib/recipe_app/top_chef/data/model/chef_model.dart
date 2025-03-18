class TopChefModel {
  final int id;
  final String username;
  final String firstName, lastName;
  final String photo;

  TopChefModel({
    required this.photo,
    required this.username,
    required this.lastName,
    required this.id,
    required this.firstName,
  });

  factory TopChefModel.fromJson(Map<String, dynamic> json) {
    return TopChefModel(
      photo: json['photo'],
      username: json['username'],
      lastName: json['lastName'],
      id: json['id'],
      firstName: json['firstName'],
    );
  }
}

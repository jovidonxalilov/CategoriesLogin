class TopChefsModel {
  final int id;
  final String firstName, photo;

  TopChefsModel({
    required this.id,
    required this.photo,
    required this.firstName,
  });

  factory TopChefsModel.fromJson(Map<String, dynamic> json) {
    return TopChefsModel(
      id: json['id'],
      photo: json['photo'],
      firstName: json['firstName'],
    );
  }
}

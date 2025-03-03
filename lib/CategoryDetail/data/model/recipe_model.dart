class RecipeModel {
  final int id, categoryid;
  final String title, description;
  final String photo;
  final int timeRequired;
  final num rating;

  RecipeModel({
    required this.id,
    required this.categoryid,
    required this.title,
    required this.description,
    required this.photo,
    required this.timeRequired,
    required this.rating,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['id'],
      categoryid: json['categoryId'],
      title: json['title'],
      description: json['description'],
      photo: json['photo'],
      timeRequired: json['timeRequired'],
      rating: json['rating'],
    );
  }
}

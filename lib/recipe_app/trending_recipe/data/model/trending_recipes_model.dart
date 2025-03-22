class TrendingRecipesModel {
  final int id, categoryId;
  final String title, description, difficulty, photo;
  final num timeRequired, rating;

  TrendingRecipesModel({
    required this.photo,
    required this.id,
    required this.title,
    required this.description,
    required this.timeRequired,
    required this.rating,
    required this.categoryId,
    required this.difficulty,
  });

  factory TrendingRecipesModel.fromJson(Map<String, dynamic> json) {
    return TrendingRecipesModel(
      photo: json['photo'],
      id: json['id'],
      title: json['title'],
      description: json['description'],
      timeRequired: json['timeRequired'],
      rating: json['rating'],
      categoryId: json['categoryId'],
      difficulty: json['difficulty'],
    );
  }
}

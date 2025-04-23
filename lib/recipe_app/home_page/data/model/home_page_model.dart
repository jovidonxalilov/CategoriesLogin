class HomePageModel {
  final int id, categoryId;
  final String title, description;
  final String photo;
  final num rating, timeRequired;

  HomePageModel({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.photo,
    required this.timeRequired,
    required this.rating,
    // required this.difficulty,
  });

  factory HomePageModel.fromJson(Map<String, dynamic> json) {
    return HomePageModel(
      id: json['id'],
      categoryId: json['categoryId'],
      title: json['title'],
      description: json['description'],
      photo: json['photo'],
      timeRequired: json['timeRequired'],
      rating: json['rating'],
      // difficulty: json['difficulty']
    );
  }
}

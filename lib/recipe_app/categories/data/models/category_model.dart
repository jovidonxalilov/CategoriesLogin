class CategoryModelId {
  final int id;
  final String title;
  final String image;
  final bool main;

  CategoryModelId({
    required this.id,
    required this.title,
    required this.image,
    required this.main,
    required rating,
  });

  factory CategoryModelId.fromJson(Map<String, dynamic> json) {
    return CategoryModelId(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      main: json['main'],
      rating: json['rating'],
    );
  }
}

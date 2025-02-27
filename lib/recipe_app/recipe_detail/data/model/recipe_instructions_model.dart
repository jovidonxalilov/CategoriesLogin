class RecipeInstructionsModel {
  final String text;
  final int order;

  RecipeInstructionsModel({
    required this.text,
    required this.order,
  });

  factory RecipeInstructionsModel.fromJson(Map<String, dynamic> json) {
    return RecipeInstructionsModel(
      text: json['text'],
      order: json['order'],
    );
  }
}

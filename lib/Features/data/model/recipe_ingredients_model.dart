class RecipeIngredientsModel {
  final String amount, name;
  final int order;

  RecipeIngredientsModel({
    required this.amount,
    required this.name,
    required this.order,
  });

  factory RecipeIngredientsModel.fromJson(Map<String, dynamic> json) {
    return RecipeIngredientsModel(
      amount: json['amount'],
      name: json['name'],
      order: json['order'],
    );
  }
}

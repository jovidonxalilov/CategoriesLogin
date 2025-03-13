sealed class CreateReviewEvent {}

final class CreateReviewLoad extends CreateReviewEvent {
  final int recipeId;

  CreateReviewLoad({required this.recipeId});
}

final class CreateReviewRate extends CreateReviewEvent {
  final int currentIndex;

  CreateReviewRate({required this.currentIndex});
}
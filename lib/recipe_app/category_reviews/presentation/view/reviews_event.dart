
class ReviewsEvent {}

final class ReviewsLoading extends ReviewsEvent {
  final int recipeId;

  ReviewsLoading({required this.recipeId});
}

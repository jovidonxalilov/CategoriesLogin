import 'package:equatable/equatable.dart';

enum CreateReviewsStatus { idle, loading, error }

class CreateReviewsState extends Equatable {
  final int? recipeId;
  final int? currentIndex;
  final CreateReviewsStatus? status;

  const CreateReviewsState({
    required this.status,
    required this.recipeId,
    required this.currentIndex,
  });

  CreateReviewsState copyWith({
    int? recipeId,
    int? currentIndex,
    CreateReviewsStatus? status,
  }) {
    return CreateReviewsState(
      recipeId: recipeId ?? this.recipeId,
      currentIndex: currentIndex ?? this.currentIndex,
      status: status ?? this.status,
    );
  }
  @override
  List<Object?> get props => [recipeId, currentIndex, status];
}

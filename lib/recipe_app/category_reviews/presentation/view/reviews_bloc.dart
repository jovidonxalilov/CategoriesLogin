import 'package:categorylogin/recipe_app/category_reviews/presentation/view/reviews_event.dart';
import 'package:categorylogin/recipe_app/category_reviews/presentation/view/reviews_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/categories_reviews_repository.dart';


class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  ReviewsBloc({
    required ReviewsRepository recipeRepo,
    required int recipeId,
  })  : _recipeRepo = recipeRepo,
        super(
        ReviewsState(
          recipeModel: null,
          commentModel: null,
          status: ReviewsStatus.loading,
        ),
      ) {
    on<ReviewsLoading>(_onLoad);
    add(ReviewsLoading(recipeId: recipeId,));
  }

  final ReviewsRepository _recipeRepo;

  Future<void> _onLoad(ReviewsLoading event, Emitter<ReviewsState> emit) async {
    emit(state.copyWith(status: ReviewsStatus.loading));
    final recipe = await _recipeRepo.fetchReviews(event.recipeId);
    final comment = await _recipeRepo.fetchReviewComment(event.recipeId);
    emit(state.copyWith(recipeModel: recipe,comment: comment,status: ReviewsStatus.idle));
  }
}
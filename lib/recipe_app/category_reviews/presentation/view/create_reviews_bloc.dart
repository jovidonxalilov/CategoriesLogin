import 'package:categorylogin/recipe_app/category_reviews/presentation/page/create_reviews_view.dart';
import 'package:categorylogin/recipe_app/category_reviews/presentation/view/create_reviews_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'create_reviews_event.dart';

class CreateReviewBloc extends Bloc<CreateReviewEvent, CreateReviewsState> {
  CreateReviewBloc()
      : super(
    CreateReviewsState(
      recipeId: null,
      currentIndex: null,
      status: CreateReviewsStatus.loading,
    ),
  ) {
    on<CreateReviewRate>(_onRate);
  }

  Future<void> _onRate(CreateReviewRate event, Emitter<CreateReviewsState> emit) async {
    emit(state.copyWith(currentIndex: event.currentIndex, status: CreateReviewsStatus.idle));
  }
}
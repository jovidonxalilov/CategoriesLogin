import 'package:categorylogin/recipe_app/top_chef/presentation/view/top_chefs/top_chefs_events.dart';
import 'package:categorylogin/recipe_app/top_chef/presentation/view/top_chefs/top_chefs_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/chef_repository.dart';

class TopChefsBloc extends Bloc<TopChefsEvent, TopChefsState> {
  TopChefsBloc({required ChefRepository chefRepo})
      : _chefRepo = chefRepo,
        super(TopChefsState.initial()) {
    on<TopChefsLoading>(_onLoad);
    add(TopChefsLoading());
  }

  final ChefRepository _chefRepo;

  Future<void> _onLoad(TopChefsLoading event, Emitter<TopChefsState> emit) async {
    emit(
      state.copyWith(
        mostViewedChefsStatus: TopChefsStatus.loading,
        mostLikedChefsStatus: TopChefsStatus.loading,
        newChefsStatus: TopChefsStatus.loading,
      ),
    );

    final mostViewedChefs = await _chefRepo.fetchMostViewedChefs();
    emit(state.copyWith(mostViewedChefs: mostViewedChefs, mostViewedChefsStatus: TopChefsStatus.success));
    final mostLikedChefs = await _chefRepo.fetchMostLikedChefs();
    emit(state.copyWith(mostLikedChefs: mostLikedChefs, mostLikedChefsStatus: TopChefsStatus.success));
    final newChefs = await _chefRepo.fetchNewChefs();
    emit(state.copyWith(newChefs: newChefs, newChefsStatus: TopChefsStatus.success));
  }
}


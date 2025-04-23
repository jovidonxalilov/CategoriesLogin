import 'package:bloc/bloc.dart';
import 'package:categorylogin/recipe_app/top_chef/data/repository/profile_repository.dart';
import 'package:categorylogin/recipe_app/top_chef/presentation/view/top_chefs_profile/top_chefs_profile_event.dart';
import 'package:categorylogin/recipe_app/top_chef/presentation/view/top_chefs_profile/top_chefs_profile_state.dart';
import '../../../../profle/data/repository/ProfileRepository.dart';

class TopChefsProfileBloc extends Bloc<TopChefsProfileEvent, TopChefsProfileState> {
  final ProfileRepository _userRepo;

  TopChefsProfileBloc({
    // required RecipeRepository recipeRepo,
    required ProfileRepository userRepo,
  })  :
        _userRepo = userRepo,
        super(TopChefsProfileState.initial()) {
    on<TopChefsProfileLoading>(_load);
  }

  Future<void> _load(TopChefsProfileLoading event, Emitter<TopChefsProfileState> emit) async {
    emit(state.copyWith(
      status: TopChefsProfileStatus.loading,
    ));
    final user=await _userRepo.fetchUserInfo();
    final recipe=await _userRepo.fetchProfileRecipes(event.id);
    emit(state.copyWith(recipe: recipe, profile: user, status: TopChefsProfileStatus.success));
  }
}

import 'package:categorylogin/recipe_app/trending_recipe/data/repository/trending_recipes_repository.dart';
import 'package:categorylogin/recipe_app/trending_recipe/presentation/view/trending_recipes_state.dart';
import 'package:categorylogin/recipe_app/trending_recipe/presentation/view/trending_resipec_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingRecipesBloc
    extends Bloc<TrendingRecipesEvent, TrendingRecipesState> {
  TrendingRecipesBloc({
    required TrendingRecipesRepository recipeRepo,
  })  : _recipeRepo = recipeRepo,
        super(
          TrendingRecipesState(
              status: TrendingRecipesStatus.loading, recipesModel: [], recipeModel: null),
        ) {
    on<TrendingRecipesLoading>(_onLoad);
  }

  final TrendingRecipesRepository _recipeRepo;
  Future<void> _onLoad(TrendingRecipesLoading event, Emitter<TrendingRecipesState> emit) async {
    emit(state.copyWith(status: TrendingRecipesStatus.loading, recipesModel: []));
    final recipesModel = await _recipeRepo.fetchTrendingRecipes();
    final recipeModel =  await _recipeRepo.fetchTrendingRecipe();
    emit(state.copyWith(recipesModel: recipesModel, recipeModel: recipeModel, status: TrendingRecipesStatus.idle));
  }
}

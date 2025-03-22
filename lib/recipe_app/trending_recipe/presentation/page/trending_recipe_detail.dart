import 'package:categorylogin/core/utils.dart';
import 'package:categorylogin/recipe_app/common/presentation/widgets/recipe_app_bar.dart';
import 'package:categorylogin/recipe_app/community/presentation/widget/community_bottom_bar.dart';
import 'package:categorylogin/recipe_app/trending_recipe/presentation/page/trendin_recipe.dart';
// import 'package:categorylogin/recipe_app/trending_recipe/presentation/page/trending_recipe_detail_image.dart';
import 'package:categorylogin/recipe_app/trending_recipe/presentation/view/trending_recipes_bloc.dart';
import 'package:categorylogin/recipe_app/trending_recipe/presentation/view/trending_recipes_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingRecipeDetail extends StatelessWidget {
  const TrendingRecipeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.bacround,
      appBar: RecipeAppBar(title: "Trending Recipes", actions: []),
      body: BlocBuilder<TrendingRecipesBloc, TrendingRecipesState>(
        builder: (context, state) {
          return switch (state.status) {
            TrendingRecipesStatus.idle => TrendingRecipe(state: state,),
            TrendingRecipesStatus.loading => Center(
                child: CircularProgressIndicator(),
              ),
            TrendingRecipesStatus.error => Center(
                child: Text("Something wrong?!..."),
              ),
          };
        },
      ),
      bottomNavigationBar: CommunityBottomBar(),
    );
  }
}

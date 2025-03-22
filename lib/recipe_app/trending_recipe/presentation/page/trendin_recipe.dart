import 'package:categorylogin/core/utils.dart';
import 'package:categorylogin/recipe_app/common/presentation/widgets/recipe_app_bar.dart';
import 'package:categorylogin/recipe_app/community/presentation/widget/community_bottom_bar.dart';
import 'package:categorylogin/recipe_app/trending_recipe/presentation/page/trending_recipe_list_view.dart';
import 'package:categorylogin/recipe_app/trending_recipe/presentation/view/trending_recipes_bloc.dart';
import 'package:categorylogin/recipe_app/trending_recipe/presentation/view/trending_recipes_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TrendingRecipe extends StatelessWidget {
  const TrendingRecipe({
    super.key, required this.state,
  });
  final TrendingRecipesState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Trending Recipe",
          style: TextStyle(
            color: AppColors.redpinkmain,
            fontSize: 15.h,
          ),
        ),
        SizedBox(height: 9.h),
        Container(
          width: double.infinity.w,
          height: 241.h,
          decoration: BoxDecoration(
            color: AppColors.redpinkmain,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 36, right: 36),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Most Viewed Today",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.h,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Stack(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 110, left: 4, right: 4),
                      child: Container(
                        width: 348.w,
                        height: 49.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                              color: AppColors.redpinkmain, width: 2.w),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 12, left: 15, right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      state.recipeModel!.title,
                                      style: TextStyle(
                                        color: AppColors.bacround,
                                        fontSize: 9,
                                      ),
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/clock.svg",
                                    width: 12.w,
                                    height: 12.h,
                                    color: AppColors.redpinkmain,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "${state.recipeModel!.timeRequired} min",
                                    style: TextStyle(
                                      color: AppColors.redpinkmain,
                                      fontSize: 8,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      state.recipeModel!.description,
                                      style: TextStyle(
                                        color:
                                            Colors.black.withValues(alpha: 0.5),
                                        fontSize: 8,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    state.recipeModel!.rating.toString(),
                                    style: TextStyle(
                                      color: AppColors.pink,
                                      fontSize: 8,
                                    ),
                                  ),
                                  SizedBox(width: 3),
                                  SvgPicture.asset(
                                    "assets/icons/clock.svg",
                                    width: 12.w,
                                    height: 12.h,
                                    color: AppColors.pink,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(20),
                      shadowColor: Colors.black,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          state.recipeModel!.photo,
                          width: 358,
                          height: 143.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        TrendingRecipeListView(state: state,),
      ],
    );
  }
}

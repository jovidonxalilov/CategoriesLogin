import 'package:categorylogin/core/utils.dart';
import 'package:categorylogin/recipe_app/common/presentation/widgets/recipe_app_bar.dart';
import 'package:categorylogin/recipe_app/community/presentation/widget/community_bottom_bar.dart';
import 'package:categorylogin/recipe_app/trending_recipe/presentation/view/trending_recipes_bloc.dart';
import 'package:categorylogin/recipe_app/trending_recipe/presentation/view/trending_recipes_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TrendingRecipeListView extends StatelessWidget {
  const TrendingRecipeListView({
    super.key, required this.state,
  });
  final TrendingRecipesState state;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: state.recipesModel!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 33,
              right: 36,
              left: 36,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 110),
                          child: Container(
                            width: 207,
                            height: 121,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: AppColors.redpinkmain,
                                width: 1.5,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 33, top: 9),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    state.recipesModel![index].title,
                                    style: TextStyle(
                                      color: AppColors.bacround,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6.h,
                                  ),
                                  Text(
                                    state.recipesModel![index].description,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                      color:
                                          AppColors.bacround.withOpacity(0.7),
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/clock.svg",
                                        width: 12.w,
                                        height: 12.h,
                                        color: AppColors.redpinkmain,
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      Text(
                                        "${state.recipesModel![index].timeRequired.toString()}min",
                                        style: TextStyle(
                                          color: AppColors.redpinkmain,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 18,
                                      ),
                                      Text(
                                        state.recipesModel![index].difficulty,
                                        style: TextStyle(
                                          color: AppColors.redpinkmain,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      SvgPicture.asset(
                                        "assets/icons/difficulty.svg",
                                        width: 12.w,
                                        height: 12.h,
                                        color: AppColors.redpinkmain,
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(
                                        state.recipesModel![index].rating
                                            .toString(),
                                        style: TextStyle(
                                          color: AppColors.redpinkmain,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SvgPicture.asset(
                                        "assets/yulduz.svg",
                                        width: 12.w,
                                        height: 12.h,
                                        color: AppColors.redpinkmain,
                                        fit: BoxFit.cover,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(15),
                          shadowColor: Colors.black.withOpacity(1),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              state.recipesModel![index].photo,
                              width: 150.w,
                              height: 150.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

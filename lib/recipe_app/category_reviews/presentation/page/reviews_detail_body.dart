import 'package:categorylogin/core/utils.dart';
import 'package:categorylogin/recipe_app/category_reviews/presentation/view/reviews_view_model.dart';
import 'package:categorylogin/recipe_app/category_reviews/presentation/widget/categories_reviews_comments.dart';
import 'package:categorylogin/recipe_app/category_reviews/presentation/widget/categories_reviews_star.dart';
import 'package:categorylogin/recipe_app/community/presentation/widget/community_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/model/reviews_comment_model.dart';
import '../view/reviews_bloc.dart';
import '../view/reviews_state.dart';

class ReviewsDetailBody extends StatelessWidget {
  const ReviewsDetailBody({
    super.key, required this.state,
  });
  final ReviewsState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: double.infinity.w,
          height: 223,
          decoration: BoxDecoration(
            color: AppColors.redpinkmain,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 30.h, left: 37.w, bottom: 30.h),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    state.recipeModel!.photo,
                    width: 162.w,
                    height: 168.h,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.recipeModel!.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      CategoriesReviewsStar(
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 4.5.w,
                      ),
                      Text(
                        '(${state.recipeModel!.reviewsCount.toString()})',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              state.recipeModel!.user.profilePhoto,
                              width: 32,
                              height: 33,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.recipeModel!.user.username,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    state.recipeModel!.user.firstName,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    state.recipeModel!.user.lastName,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      Container(
                        width: 126.w,
                        height: 24.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            "Add Review",
                            style: TextStyle(
                              color: AppColors.redpinkmain,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 27.h, left: 36.w, right: 36.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Comments",
                style: TextStyle(
                  color: AppColors.redpinkmain,
                  fontSize: 15,
                ),
              ),
              // CategoriesReviewsComments(
              //   comment: state.commentModel!.first,
              // ),
              // CategoriesReviewsComments(
              //   comment: state.commentModel!.first,
              // ),
              // CategoriesReviewsComments(
              //   comment: state.commentModel!.first,
              // ),
              // CategoriesReviewsComments(
              //   comment: state.commentModel!.first,
              // ),
              // CategoriesReviewsComments(
              //   comment: state.commentModel!.first,
              // ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:categorylogin/core/utils.dart';
import 'package:categorylogin/recipe_app/category_reviews/presentation/page/categories_reviews_comments.dart';
import 'package:categorylogin/recipe_app/category_reviews/presentation/page/categories_reviews_star.dart';
import 'package:categorylogin/recipe_app/community/presentation/widget/community_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CategoriesReviews extends StatelessWidget {
  const CategoriesReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bacround,
      appBar: AppBar(
        backgroundColor: AppColors.bacround,
        toolbarHeight: 50,
        leading: Center(child: SvgPicture.asset("assets/back.svg")),
        title: Center(
          child: Text(
            "Reviews",
            style: TextStyle(
              color: AppColors.redpinkmain,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
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
                        child: Image.asset(
                          "assets/image.png",
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
                              "Chicken Burger",
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
                              "(456 reviews)",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                              ),
                            ),
                            SizedBox(
                              height: 13,
                            ),
                            Row(
                              children: [
                                Image.asset("assets/Ellipse.png"),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "@Andrew-Mar",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                      ),
                                    ),
                                    Text(
                                      "Andrew Martinez-Chef",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                      ),
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
                  children: [
                    Text(
                      "Comments",
                      style: TextStyle(
                        color: AppColors.redpinkmain,
                        fontSize: 15,
                      ),
                    ),
                    CategoriesReviewsComments(),
                    CategoriesReviewsComments(),
                    CategoriesReviewsComments(),
                    CategoriesReviewsComments(),
                    CategoriesReviewsComments(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: CommunityBottomBar(),
    );
  }
}

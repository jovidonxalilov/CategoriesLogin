import 'package:categorylogin/core/utils.dart';
import 'package:categorylogin/recipe_app/category_reviews/presentation/page/categories_reviews_star.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesReviewsComments extends StatelessWidget {
  const CategoriesReviewsComments({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 17.h,
        ),
        Row(
          children: [
            Image.asset(
              "assets/Ellipse.png",
            ),
            SizedBox(
              width: 13.w,
            ),
            Expanded(
              child: Text(
                "@r_joshua",
                style: TextStyle(
                  color: AppColors.redpinkmain,
                  fontSize: 15,
                ),
              ),
            ),
            Text(
              "(15 mins ago)",
              style: TextStyle(
                color: AppColors.redpinkmain,
                fontSize: 15,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 13.h,
        ),
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
          "Praesent fringilla eleifend purus vel dignissim. Praesent"
          "urna ante, iaculis at lobortis eu.",
          style: TextStyle(
            color: Colors.white,
            fontSize: 13.5,
          ),
        ),
        SizedBox(
          height: 13.h,
        ),
        CategoriesReviewsStar(
          color: AppColors.redpinkmain,
        ),
        SizedBox(
          height: 24.h,
        ),
        Divider(
          color: AppColors.redpink,
          thickness: 2,
        ),
      ],
    );
  }
}

import 'package:categorylogin/core/utils.dart';
import 'package:categorylogin/recipe_app/category_reviews/presentation/widget/categories_reviews_star.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/model/reviews_comment_model.dart';

class CategoriesReviewsComments extends StatelessWidget {
  const CategoriesReviewsComments({
    super.key,
    required this.comment
  });
  final ReviewsCommentsModel comment;
  String timeAgo(String isoDate) {
    DateTime createdDate = DateTime.parse(isoDate);
    DateTime now = DateTime.now();
    Duration difference = now.difference(createdDate);

    if (difference.inDays >= 30) {
      int monthsAgo = (difference.inDays / 30).floor();
      return "$monthsAgo month${monthsAgo > 1 ? 's' : ''} ago";
    } else if (difference.inDays > 0) {
      return "${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago";
    } else if (difference.inHours > 0) {
      return "${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago";
    } else if (difference.inMinutes > 0) {
      return "${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago";
    } else {
      return "Just now";
    }
  }

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
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                comment.user.profilePhoto,
                width: 35.w,
                height: 35.h,
              ),
            ),
            SizedBox(
              width: 13.w,
            ),
            Expanded(
              child: Text(
                comment.user.username,
                style: TextStyle(
                  color: AppColors.redpinkmain,
                  fontSize: 15,
                ),
              ),
            ),
            Text(
              timeAgo(comment.created.toString()),
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
          comment.comment,
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CategoriesReviewsStar extends StatelessWidget {
  const CategoriesReviewsStar({
    super.key, required this.color,
  });
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/yulduz.svg",
          color: color,
        ),
        SizedBox(
          width: 4.5.w,
        ),
        SvgPicture.asset(
          "assets/yulduz.svg",
          color: color,
        ),
        SizedBox(
          width: 4.5.w,
        ),
        SvgPicture.asset(
          "assets/yulduz.svg",
          color: color,
        ),
        SizedBox(
          width: 4.5.w,
        ),
        SvgPicture.asset(
          "assets/yulduz.svg",
          color: color,
        ),
        SizedBox(
          width: 4.5.w,
        ),
        SvgPicture.asset(
          "assets/starr.svg",
          color: color,
        ),
      ],
    );
  }
}

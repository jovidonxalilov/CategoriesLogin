import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../../../../core/utils.dart';

class RecipeRating extends StatelessWidget {
  const RecipeRating({
    super.key,
    required this.rating,
    this.textColor = AppColors.redpinkmain,
    this.iconColor = AppColors.redpink,
    this.swap = false,
  });

  final Color textColor, iconColor;
  final bool swap;



  final num rating;

  @override
  Widget build(BuildContext context) {
    final text = Text(
      rating.toString(),
      style: TextStyle(
        color: textColor,
        fontSize: 12,
      ),
    );

    final icon = SvgPicture.asset(
      "assets/icons/star.svg",
      colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
    );
    return Row(
      spacing: 5,
      children: [
        swap ? icon : text,
        swap ? text : icon,
      ],
    );
  }
}

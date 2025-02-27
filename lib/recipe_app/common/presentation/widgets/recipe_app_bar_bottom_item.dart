import 'package:flutter/material.dart';
import '../../../../core/utils.dart';

class RecipeAppBarBottomItem extends StatelessWidget {
  const RecipeAppBarBottomItem({
    super.key,
    required this.title,
    required this.callback,
    required this.isSelected,
  });

  final bool isSelected;

  final String title;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.redpinkmain : Colors.transparent,
        borderRadius: BorderRadius.circular(18),
      ),
      child: TextButton(
        onPressed: callback,
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.redpinkmain,
            fontSize: 16,
            fontFamily: "League Spartan",
          ),
        ),
      ),
    );
  }
}

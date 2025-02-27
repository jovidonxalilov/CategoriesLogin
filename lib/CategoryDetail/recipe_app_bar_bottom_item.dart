import 'package:categorylogin/Categories/data/models/category_model.dart';
import 'package:flutter/material.dart';

import '../utils.dart';

class RecipeAppBarBottomItem extends StatelessWidget {
  const RecipeAppBarBottomItem({
    super.key,
    required this.callback, required this.title, required this.isSelected,
  });
  final bool isSelected;
  final VoidCallback callback;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.redpinkmain : Colors.transparent,
        borderRadius: BorderRadius.circular(18),
      ),
      alignment: Alignment.center,
      child: TextButton(
        onPressed: callback,
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        child: Text(
          title,
          style: TextStyle(color: isSelected ? Colors.white: AppColors.redpinkmain, fontSize: 14),
        ),
      ),
    );
  }
}

import 'package:categorylogin/core/utils.dart';
import 'package:flutter/material.dart';

import '../view/recipe_detail_view_model.dart';

class RecipeDetailInstructions extends StatelessWidget {
  const RecipeDetailInstructions({
    super.key,
    required this.vm, required this.id, required this.colors,
  });
  final int id;
  final Color colors;

  final RecipeDetailViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 81,
      decoration: BoxDecoration(
        color: colors,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 23, bottom: 22, left: 10, right: 10),
        child: Text(
          vm.recipe.instructions
              .where((e) => e.order == id)
              .map((e) => e.text)
              .join(", "),
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.bacround,
          ),
        ),
      ),
    );
  }
}

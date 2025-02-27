import 'package:flutter/material.dart';

import '../../../../core/utils.dart';
import '../../data/model/recipe_model.dart';

class RecipeItemDescription extends StatelessWidget {
  const RecipeItemDescription({
    super.key,
    required this.recipe,
  });

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return Text(
      recipe.description,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: AppColors.bacround,
        fontFamily: "League Spartan",
        fontSize: 13,
        fontWeight: FontWeight.w300,
        height: 1,
      ),
    );
  }
}

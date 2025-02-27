import 'package:flutter/material.dart';

import '../../../../core/utils.dart';
import '../../data/model/recipe_model.dart';

class RecipeItemTitle extends StatelessWidget {
  const RecipeItemTitle({
    super.key,
    required this.recipe,
  });

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return Text(
      recipe.title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: AppColors.bacround,
        fontSize: 12,
      ),
    );
  }
}

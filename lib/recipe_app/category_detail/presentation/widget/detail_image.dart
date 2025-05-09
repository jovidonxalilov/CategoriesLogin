import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/rout/routes.dart';
import '../../../../core/utils.dart';
import '../../data/model/recipe_model.dart';

class RecipeItemImage extends StatelessWidget {
  const RecipeItemImage({
    super.key,
    required this.recipe,
  });

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: 169,
        height: 153,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.bacround.withValues(alpha: 0.25),
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: GestureDetector(
            onTap: () {
              context.push(Routes.recipeDetail);
            },
            child: Image(
              image: CachedNetworkImageProvider(recipe.photo),
              width: 169,
              height: 153,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress?.expectedTotalBytes == loadingProgress?.cumulativeBytesLoaded) {
                  return child;
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

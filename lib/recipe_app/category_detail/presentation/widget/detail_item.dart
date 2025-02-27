import 'package:flutter/material.dart';
import '../../../common/presentation/widgets/recipe_icon_button_container.dart';
import '../../data/model/recipe_model.dart';
import 'detail_image.dart';
import 'detail_view.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem({
    super.key,
    required this.recipe,
  });

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 169,
        height: 226,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            RecipeItemInfo(recipe: recipe),
            RecipeItemImage(recipe: recipe),
            Positioned(
              top: 7,
              right: 8,
              child: RecipeIconButtonContainer(
                image: "assets/icons/heart.svg",
                callback: () {},
                iconWidth: 16,
                iconHeight: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

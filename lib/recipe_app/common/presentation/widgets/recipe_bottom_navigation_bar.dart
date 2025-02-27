import 'package:categorylogin/recipe_app/common/presentation/widgets/recipe_icon_button.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils.dart';

class RecipeBottomNavigationBar extends StatelessWidget {
  const RecipeBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: 128,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.bacround, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 36),
            child: Container(
              width: 280,
              height: 56,
              decoration: BoxDecoration(
                color: AppColors.redpinkmain,
                borderRadius: BorderRadius.circular(33),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RecipeIconButton(
                    image: "assets/icons/home.svg",
                    callback: () {},
                  ),
                  RecipeIconButton(
                    image: "assets/icons/community.svg",
                    callback: () {},
                  ),
                  RecipeIconButton(
                    image: "assets/icons/categories.svg",
                    callback: () {
                      // context.go(categories);
                    },
                  ),
                  RecipeIconButton(
                    image: "assets/icons/profile.svg",
                    callback: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

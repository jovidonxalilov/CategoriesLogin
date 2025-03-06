import 'package:categorylogin/core/rout/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils.dart';
import '../../../common/presentation/widgets/recipe_icon_button.dart';
import '../../../recipe_detail/precentation/page/recipe_detail.dart';

class CommunityBottomBar extends StatelessWidget {
  const CommunityBottomBar({super.key});

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
                    callback: () {
                      context.go(Routes.recipeDetail);
                    },
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

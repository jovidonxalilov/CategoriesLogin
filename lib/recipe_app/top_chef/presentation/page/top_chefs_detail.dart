import 'package:categorylogin/core/utils.dart';
import 'package:categorylogin/recipe_app/common/presentation/widgets/recipe_app_bar_bottom.dart';
import 'package:categorylogin/recipe_app/common/presentation/widgets/recipe_bottom_navigation_bar.dart';
import 'package:categorylogin/recipe_app/common/presentation/widgets/recipe_icon_button_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/presentation/widgets/recipe_app_bar.dart';

class TopChefsDetail extends StatelessWidget {
  const TopChefsDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bacround,
      extendBody: true,
      appBar: RecipeAppBar(
        title: "@neil_tran",
        actions: [
          RecipeIconButtonContainer(image: "assets/icons/share.svg", callback: () {}, iconWidth: 15.w, iconHeight: 16.h),
          SizedBox(width: 5.w,),
          RecipeIconButtonContainer(image: "assets/icons/three_dots.svg", callback: () {}, iconWidth: 15.w, iconHeight: 16.h),
        ],
      ),
      body: ListView(
        children: [

        ],
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}

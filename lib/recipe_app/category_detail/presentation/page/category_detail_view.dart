import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/presentation/widgets/recipe_app_bar.dart';
import '../../../common/presentation/widgets/recipe_app_bar_bottom.dart';
import '../../../common/presentation/widgets/recipe_bottom_navigation_bar.dart';
import '../../../common/presentation/widgets/recipe_icon_button_container.dart';
import '../view/categoy_view_model.dart';
import 'category_detail_body.dart';

class CategoryDetailView extends StatelessWidget {
  const CategoryDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CategoryDetailViewModel>();
    if (vm.isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Scaffold(
        extendBody: true,
        appBar: RecipeAppBar(
          title: vm.selected.title,
          actions: [
            RecipeIconButtonContainer(
              image: "assets/notifaction.svg",
              callback: () {},
              iconWidth: 12,
              iconHeight: 18,
            ),
            SizedBox(width: 5),
            RecipeIconButtonContainer(
              image: "assets/search.svg",
              callback: () {},
              iconWidth: 12,
              iconHeight: 18,
            ),
          ],
          bottom: RecipeAppBarBottom(),
        ),
        body: CategoryDetailBody(),
        bottomNavigationBar: RecipeBottomNavigationBar(),
      );
    }
  }
}

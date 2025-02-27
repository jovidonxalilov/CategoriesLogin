import 'package:categorylogin/CategoryDetail/presentation/view/categoy_view_model.dart';
import 'package:categorylogin/CategoryDetail/recipe_app_bar_bottom_item.dart';
import 'package:flutter/material.dart';

class recipeAppbarBottom extends StatelessWidget {
  const recipeAppbarBottom({
    super.key,
    required this.vm,
  });

  final CategoryDetailViewModel vm;

  @override
  Size get preferredSize => const Size(double.infinity, 25);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var category in vm.categories)
            RecipeAppBarBottomItem(
              title: category.title,
              callback: () => vm.selected = category,
              isSelected: category.id == vm.selected.id,
            ),
        ],
      ),
    );
  }
}

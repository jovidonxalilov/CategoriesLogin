import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../category_detail/presentation/view/categoy_view_model.dart';
import 'recipe_app_bar_bottom_item.dart';

class RecipeAppBarBottom extends StatelessWidget implements PreferredSizeWidget {
  const RecipeAppBarBottom({super.key});

  @override
  Size get preferredSize => const Size(double.infinity, 50);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CategoryDetailViewModel>();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 10,
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

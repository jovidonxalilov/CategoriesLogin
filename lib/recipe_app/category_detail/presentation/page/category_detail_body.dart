
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../data/model/recipe_model.dart';
import '../view/categoy_view_model.dart';
import '../widget/detail_item.dart';

class CategoryDetailBody extends StatelessWidget {
  const CategoryDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CategoryDetailViewModel>();
    return AnimatedSwitcher(
      duration: Duration(
        microseconds: 500,
      ),
      transitionBuilder: (child, animation) {
        Animation<Offset> slideInAnimation = Tween<Offset>(
          begin: Offset(vm.right ? 1.0 : -1.0, 0.0),
          end: Offset(0.0, 0.0),
        ).animate(animation);
        Animation<Offset> slideOutAnimation = Tween<Offset>(
          begin: Offset(vm.right ? -1.0 : 1.0, 0.0),
          end: Offset(0.0, 0.0),
        ).animate(animation);
        if (child.key == ValueKey<List<RecipeModel>>(vm.recipes)) {
          return SlideTransition(position: slideInAnimation, child: child);
        } else {
          return SlideTransition(position: slideOutAnimation, child: child);
        }
      },
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 226,
          mainAxisSpacing: 30,
        ),
        itemCount: vm.recipes.length,
        itemBuilder: (context, index) => RecipeItem(recipe: vm.recipes[index]),
      ),
    );
  }
}

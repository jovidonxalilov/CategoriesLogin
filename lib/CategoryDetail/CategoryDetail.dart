import 'package:categorylogin/Categories/data/repository/categories_repository.dart';
import 'package:categorylogin/CategoryDetail/app_bar_widget.dart';
import 'package:categorylogin/CategoryDetail/presentation/view/categoy_view_model.dart';
import 'package:categorylogin/CategoryDetail/recipe_appbar_bottom.dart';
import 'package:categorylogin/core/client.dart';
import 'package:flutter/material.dart';

import '../Features/data/repository/detail_repository.dart';
import '../utils.dart';

void main() {
  runApp(CategoryDetailView());
}

class CategoryDetailView extends StatelessWidget {
  const CategoryDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CategoryDetail(
        vm: CategoryDetailViewModel(
          catRepo: CategoriesRepository(
            client: ApiClient(),
          ),
          recipeRepo: RecipeRepository(
            client: ApiClient(),
          ),
        )..load(),
      ),
    );
  }
}

class CategoryDetail extends StatelessWidget {
  const CategoryDetail({super.key, required this.vm});

  final CategoryDetailViewModel vm;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: vm,
      builder: (context, child) => Scaffold(
        backgroundColor: AppColors.bacround,
        appBar: RecipeAppBarWidget(
          toolbarHeight: 40,
          title: vm.selected.title,
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 25),
            child: recipeAppbarBottom(vm: vm),
          ),
        ),
        body: ListView(
          children: [
            Center(
              child: Text(
                "salom",
                style: TextStyle(fontSize: 50),
              ),
            )
          ],
        ),
      ),
    );
  }
}

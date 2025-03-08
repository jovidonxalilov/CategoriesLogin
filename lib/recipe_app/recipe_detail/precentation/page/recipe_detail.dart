import 'package:categorylogin/recipe_app/recipe_detail/precentation/view/recipe_detail_view_model.dart';
import 'package:categorylogin/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/rout/routes.dart';
import '../../../common/presentation/widgets/recipe_bottom_navigation_bar.dart';
import '../widget/recipe_detail_body.dart';

class RecipeDetailPage extends StatelessWidget {
  const RecipeDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<RecipeDetailViewModel>();
    if (vm.isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListenableBuilder(
        listenable: vm,
        builder: (context, child) => Scaffold(
          backgroundColor: AppColors.bacround,
          appBar: AppBar(
            backgroundColor: AppColors.bacround,
            toolbarHeight: 50,
            leading: Center(
              child: GestureDetector(
                onTap: () {
                  context.go(Routes.community);
                },
                child: SvgPicture.asset(
                  "assets/back.svg",
                  width: 20,
                  height: 20,
                ),
              ),
            ),
            title: Center(
              child: Text(
                vm.recipe.title,
                style: TextStyle(
                  color: AppColors.redpinkmain,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: AppColors.redpink,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/notifaction.svg",
                          width: 22,
                          height: 22,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: AppColors.redpink,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/search.svg",
                          width: 22,
                          height: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          body: RecipeDetailBody(vm: vm),
          // bottomNavigationBar:  Text("data")
          bottomNavigationBar: SizedBox(
            width: double.infinity,
            height: 100,
            child: RecipeBottomNavigationBar(),
          ),
        ),
      );
    }
  }
}

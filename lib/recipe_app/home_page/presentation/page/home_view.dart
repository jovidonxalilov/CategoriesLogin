import 'package:categorylogin/recipe_app/home_page/presentation/view/home_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../../core/utils.dart';
import '../../../common/presentation/widgets/recipe_app_bar.dart';
import '../../../common/presentation/widgets/recipe_app_bar_bottom.dart';
import '../../../common/presentation/widgets/recipe_icon_button_container.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageView(),
    );
  }
}

class HomePageView extends StatelessWidget {
  const HomePageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomePageViewModel>();
    return Scaffold(
      backgroundColor: AppColors.bacround,
      appBar: AppBar(
        backgroundColor: AppColors.bacround,
        toolbarHeight: 70,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi! Diane",
              style: TextStyle(
                color: AppColors.redpinkmain,
                fontSize: 22,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              "What are you cooking today",
              style: TextStyle(
                color: AppColors.redpinkmain,
                fontSize: 15,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: RecipeIconButtonContainer(
              image: "assets/icons/notification.svg",
              iconWidth: 14,
              iconHeight: 19,
              callback: () {},
            ),
          ),
          SizedBox(width: 5),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: RecipeIconButtonContainer(
              image: "assets/icons/search.svg",
              iconWidth: 12,
              iconHeight: 18,
              callback: () {},
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Container(
            height: 60,
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColors.bacround, // Orqa fon rangi
            // child: ListView.builder(
            //   itemBuilder: (context, index) => Text(
            //     vm.mainCategory!.title,
            //     style: TextStyle(color: Colors.white),
            //   ),
            // ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: vm.categories.length,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    vm.categories[index].title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

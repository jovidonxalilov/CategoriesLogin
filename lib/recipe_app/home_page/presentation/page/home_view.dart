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
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 30, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Trending Recipe",
                  style: TextStyle(
                    color: AppColors.redpinkmain,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 120),
                      child: Container(
                        width: 330,
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColors.bacround,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: AppColors.redpinkmain,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 13,
                                left: 8,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Salami and cheese pizza",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                    ),
                                  ),
                                  SizedBox(height: 1),
                                  Text(
                                    "This is a quick overview of the ingredients...",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 70),
                            Padding(
                              padding: const EdgeInsets.only(top: 13, right: 8),
                              child: Column(
                                children: [
                                  Text(
                                    "30min",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Image.asset(
                      "assets/rasm.png",
                      width: double.infinity,
                      height: 143,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: double.infinity,
            height: 255,
            decoration: BoxDecoration(
              color: AppColors.redpinkmain  ,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 14, left: 25, right: 25, bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Your recipes",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/rasm2.png",
                        width: 168,
                        height: 175,
                      ),
                      Image.asset(
                        "assets/rasm2.png",
                        width: 168,
                        height: 175,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

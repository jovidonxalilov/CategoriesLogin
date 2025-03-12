import 'package:categorylogin/recipe_app/category_detail/presentation/view/categoy_view_model.dart';
import 'package:categorylogin/recipe_app/home_page/presentation/view/home_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    if (vm.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      backgroundColor: AppColors.bacround,
      appBar: AppBar(
        backgroundColor: AppColors.bacround,
        toolbarHeight: 70.h,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi! Diane",
              style: TextStyle(
                color: AppColors.redpinkmain,
                fontSize: 22.h,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "What are you cooking today",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.h,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: RecipeIconButtonContainer(
              image: "assets/icons/notification.svg",
              iconWidth: 14.w,
              iconHeight: 19.h,
              callback: () {},
            ),
          ),
          SizedBox(width: 5.w),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: RecipeIconButtonContainer(
              image: "assets/icons/search.svg",
              iconWidth: 12.w,
              iconHeight: 18.h,
              callback: () {},
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(45),
          child: _HomePageAppBarBottom(),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 19, right: 30, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Trending Recipe",
                  style: TextStyle(
                    color: AppColors.redpinkmain,
                    fontSize: 15.h,
                  ),
                ),
                SizedBox(height: 9.h),
                Stack(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 115, left: 4, right: 4),
                      child: Container(
                        width: double.infinity.w,
                        height: 70.h,
                        decoration: BoxDecoration(
                          color: AppColors.bacround,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                              color: AppColors.redpinkmain, width: 2.w),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 12, left: 15, right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      vm.mainCategory!.title,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/clock.svg",
                                    width: 12.w,
                                    height: 12.h,
                                    color: AppColors.pink,
                                  ),
                                  SizedBox(width: 4,),
                                  Text(
                                    "${vm.mainCategory!.timeRequired} min",
                                    style: TextStyle(
                                      color: AppColors.pink,
                                      fontSize: 13,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      vm.mainCategory!.description,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    vm.mainCategory!.rating.toString(),
                                    style: TextStyle(
                                      color: AppColors.pink,
                                      fontSize: 13,
                                    ),
                                  ),
                                  SizedBox(width: 3),
                                  SvgPicture.asset("assets/icons/clock.svg", width: 12.w, height: 12.h, color: AppColors.pink,),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.network(
                        vm.mainCategory!.photo,
                        width: double.infinity.w,
                        height: 150.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 255,
            decoration: BoxDecoration(
              color: AppColors.redpinkmain,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Your recipes", style: TextStyle(color: Colors.white, fontSize: 13),),
                Image.network(vm.recipeDetail!.photo, width: 100, height: 80,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HomePageAppBarBottom extends StatefulWidget {
  @override
  State<_HomePageAppBarBottom> createState() => _HomePageAppBarBottomState();
}

class _HomePageAppBarBottomState extends State<_HomePageAppBarBottom> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomePageViewModel>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        height: 30,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: vm.categories.length,
          separatorBuilder: (context, index) => SizedBox(width: 10),
          itemBuilder: (context, index) {
            bool isSelected = index == selectedIndex;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                width: 100,
                height: 25,
                decoration: BoxDecoration(
                  color:
                      isSelected ? AppColors.redpinkmain : AppColors.bacround,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    vm.categories[index].title,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

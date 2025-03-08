import 'package:categorylogin/core/utils.dart';
import 'package:categorylogin/recipe_app/community/presentation/view/community_view_model.dart';
import 'package:categorylogin/recipe_app/community/presentation/widget/community_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/rout/routes.dart';
import '../../../common/presentation/widgets/recipe_app_bar.dart';
import '../../../common/presentation/widgets/recipe_icon_button_container.dart';
import '../../data/model/community_model.dart';

class CommunityBody extends StatefulWidget {
  const CommunityBody({super.key});

  @override
  State<CommunityBody> createState() => _CommunityBodyState();
}

class _CommunityBodyState extends State<CommunityBody> {
  late PageController _pageController;

  String timeAgo(String isoDate) {
    DateTime createdDate = DateTime.parse(isoDate);
    DateTime now = DateTime.now();
    Duration difference = now.difference(createdDate);

    if (difference.inDays >= 30) {
      int monthsAgo = (difference.inDays / 30).floor();
      return "$monthsAgo month${monthsAgo > 1 ? 's' : ''} ago";
    } else if (difference.inDays > 0) {
      return "${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago";
    } else if (difference.inHours > 0) {
      return "${difference.inHours} hour${difference.inHours > 1
          ? 's'
          : ''} ago";
    } else if (difference.inMinutes > 0) {
      return "${difference.inMinutes} minute${difference.inMinutes > 1
          ? 's'
          : ''} ago";
    } else {
      return "Just now";
    }
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CommunityViewModel>();

    if (vm.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      backgroundColor: AppColors.bacround,
      appBar: RecipeAppBar(
        title: "Community",
        actions: [
          RecipeIconButtonContainer(
            image: "assets/notifaction.svg",
            callback: () {},
            iconWidth: 14.w,
            iconHeight: 17.h,
          ),
          SizedBox(width: 5.w),
          RecipeIconButtonContainer(
            image: "assets/search.svg",
            callback: () {},
            iconWidth: 14.w,
            iconHeight: 17.h,
          ),
          SizedBox(width: 10.w),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(45),
          child: _CommunityTabs(
            selectedIndex: vm.selectedTabIndex,
            onTabSelected: (index) {
              vm.updateTabIndex(index);
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          vm.updateTabIndex(index);
        },
        children: [
          _buildCommunityList(vm, "top_recipes"),
          _buildCommunityList(vm, "newest"),
          _buildCommunityList(vm, "oldest"),
        ],
      ),
      bottomNavigationBar: const CommunityBottomBar(),
    );
  }

  Widget _buildCommunityList(CommunityViewModel vm, String category) {
    List<CommunityModel> filteredList = vm.getFilteredCommunity(category);

    return Padding(
      padding: EdgeInsets.only(top: 30.h, right: 30.w, left: 30.w),
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 14.h),
        padding: EdgeInsets.only(top: 14.h),
        itemCount: filteredList.length,
        itemBuilder: (context, index) {
          final post = filteredList[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40.w),
                    child: Image.network(
                      post.user.profilePhoto,
                      width: 35.w,
                      height: 35.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 14.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.user.firstName,
                        style: TextStyle(color: Colors.white, fontSize: 10.w),
                      ),
                      Text(
                        timeAgo(post.created),
                        style: TextStyle(color: Colors.white, fontSize: 10.w),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.go('/recipe-detail/${post.id}');
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15.w),
                        topLeft: Radius.circular(15.w),
                      ),
                      child: Image.network(
                        post.photo,
                        width: double.infinity.w,
                        height: 173.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity.w,
                height: 80.w,
                decoration: BoxDecoration(
                  color: AppColors.redpinkmain,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.w),
                    bottomRight: Radius.circular(15.w),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 4.h, left: 15.w, right: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            post.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.w,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(width: 22.w),
                          SvgPicture.asset(
                            "assets/yulduz.svg",
                            width: 10.w,
                            height: 10.w,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            post.rating.toString(),
                            style: TextStyle(
                                color: Colors.white, fontSize: 15.w),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              vm.community[index].description,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.w),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/clock.svg", width: 14.w,
                                    height: 14.h,
                                    color: Colors.white,),
                                  SizedBox(width: 6.w,),
                                  Text(
                                    "${vm.community[index].timeRequired} min",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15.w),)
                                ],
                              ),
                              Row(
                                children: [
                                  Text("${vm.community[index].reviewCount}",
                                    style: TextStyle(color: Colors.white,
                                        fontSize: 15.w),),
                                  SizedBox(width: 6.w,),
                                  SvgPicture.asset(
                                    "assets/sms.svg", width: 14.w,
                                    height: 14.h,
                                    color: Colors.white,),
                                ],
                              )
                            ],
                          )
                        ],
                      )

                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.w,),
              Container(
                width: double.infinity.w,
                height: 2,
                decoration: BoxDecoration(
                  color: AppColors.redpink,
                  borderRadius: BorderRadius.circular(10.w),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _CommunityTabs extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const _CommunityTabs({
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = ["Top Recipes", "Newest", "Oldest"];
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Container(
        height: 25,
        color: AppColors.bacround,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            tabs.length,
                (index) {
              bool isSelected = selectedIndex == index;
              return GestureDetector(
                onTap: () => onTabSelected(index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 100,
                  height: 25,
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.redpinkmain : AppColors
                        .bacround,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      tabs[index],
                      style: TextStyle(fontSize: 16.w, color: Colors.white),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

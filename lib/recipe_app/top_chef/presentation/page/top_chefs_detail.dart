import 'package:categorylogin/core/utils.dart';
import 'package:categorylogin/recipe_app/common/presentation/widgets/recipe_icon_button_container.dart';
import 'package:categorylogin/recipe_app/community/presentation/widget/community_bottom_bar.dart';
import 'package:categorylogin/recipe_app/top_chef/presentation/page/top_chefs_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/presentation/widgets/recipe_app_bar.dart';
import '../view/top_chefs/top_chefs_bloc.dart';
import '../view/top_chefs/top_chefs_events.dart';
import '../view/top_chefs/top_chefs_state.dart';

class TopChefsView extends StatelessWidget {
  const TopChefsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bacround,
      extendBody: true,
      appBar: RecipeAppBar(
        title: "Top Chef",
        actions: [
          RecipeIconButtonContainer(
            image: "assets/icons/notification.svg",
            iconWidth: 14,
            iconHeight: 19,
            callback: () {},
          ),
          SizedBox(width: 5),
          RecipeIconButtonContainer(
            image: "assets/icons/search.svg",
            iconWidth: 12,
            iconHeight: 18,
            callback: () {},
          ),
        ],
      ),
      body: BlocBuilder<TopChefsBloc, TopChefsState>(builder: (context, state) {
        if (state is TopChefsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView(
            children: [
              Container(
                height: 285.h,
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 9.h),
                decoration: BoxDecoration(
                  color: AppColors.redpinkmain,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Most Viewed Chefs",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      spacing: 17,
                      children: [
                        for (var chef in state.mostViewedChefs)
                          TopChefsSection(
                            name: '${chef.firstName}-${chef.lastName}',
                            photo: chef.profilePhoto,
                            username: chef.username,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, right: 32, left: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Most Liked Shefs",
                      style:
                          TextStyle(color: AppColors.redpinkmain, fontSize: 15),
                    ),
                    SizedBox(height: 8,),
                    Row(
                      spacing: 16,
                      children: [
                        for (var chef in state.mostLikedChefs)
                          TopChefsSection(
                            name: '${chef.firstName}-${chef.lastName}',
                            photo: chef.profilePhoto,
                            username: chef.username,
                          ),
                      ],
                    ),
                    Text(
                      "New Shefs",
                      style:
                      TextStyle(color: AppColors.redpinkmain, fontSize: 15),
                    ),
                    SizedBox(height: 8,),
                    Row(
                      spacing: 16,
                      children: [
                        for (var chef in state.newChefs)
                          TopChefsSection(
                            name: '${chef.firstName}-${chef.lastName}',
                            photo: chef.profilePhoto,
                            username: chef.username,
                          ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          );
        }
      }),
      bottomNavigationBar: CommunityBottomBar(),
    );
  }
}

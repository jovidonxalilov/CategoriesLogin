import 'package:categorylogin/core/utils.dart';
import 'package:categorylogin/recipe_app/top_chef/presentation/view/top_chefs_profile/top_chefs_profile_bloc.dart';
import 'package:categorylogin/recipe_app/top_chef/presentation/view/top_chefs_profile/top_chefs_profile_state.dart';
import 'package:categorylogin/recipe_app/top_chef/presentation/widget/chefs_profile_recipes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/presentation/widgets/recipe_app_bar.dart';
import '../../../common/presentation/widgets/recipe_bottom_navigation_bar.dart';
import '../../../common/presentation/widgets/recipe_icon_button_container.dart';
import '../../../community/presentation/widget/community_bottom_bar.dart';

class TopChefsProfileDetail extends StatelessWidget {
  const TopChefsProfileDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.bacround,
      appBar: RecipeAppBar(
        title: "@neil_tran",
        actions: [
          RecipeIconButtonContainer(
              image: "assets/icons/share.svg",
              callback: () {},
              iconWidth: 15.w,
              iconHeight: 16.h),
          SizedBox(
            width: 5.w,
          ),
          RecipeIconButtonContainer(
              image: "assets/icons/three_dots.svg",
              callback: () {},
              iconWidth: 15.w,
              iconHeight: 16.h),
        ],
      ),
      body: BlocBuilder<TopChefsProfileBloc, TopChefsProfileState>(
        builder: (context, state) {
          return switch (state.status) {
            TopChefsProfileStatus.idle =>
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 37, right: 37),
                  child: ListView.builder(
                    itemCount: state.recipes.length,
                    itemBuilder: (context, index) => Center(
                      child: Column(
                        children: [
                          Image.network(state.recipes[index].photo),
                        ],
                      ),
                    ),
                    // children: [
                    //   Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Row(
                    //         children: [
                    //           Image.network(
                    //           state.userInfo!.image,
                    //           width: 102.w,
                    //           height: 102.h,
                    //           fit: BoxFit.cover,
                    //           ),
                    //           SizedBox(width: 14),
                    //           Column(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             mainAxisAlignment: MainAxisAlignment.start,
                    //             children: [
                    //               Text(
                    //                 "Neil Tran-Chef",
                    //                 style: TextStyle(
                    //                   color: AppColors.redpinkmain,
                    //                   fontSize: 15,
                    //                   fontWeight: FontWeight.w600,
                    //                 ),
                    //               ),
                    //               SizedBox(height: 10.h),
                    //               Text(
                    //                 "Passionate chef in creative and\n"
                    //                     "contemporary cuisine.",
                    //                 style: TextStyle(
                    //                   color: Colors.white,
                    //                   fontSize: 12,
                    //                   fontWeight: FontWeight.w600,
                    //                 ),
                    //               ),
                    //               Container(
                    //                 width: 81.w,
                    //                 height: 25.h,
                    //                 decoration: BoxDecoration(
                    //                   color: AppColors.redpink,
                    //                   borderRadius: BorderRadius.circular(50),
                    //                 ),
                    //                 child: Center(
                    //                   child: Text(
                    //                     "Following",
                    //                     style: TextStyle(
                    //                       color: AppColors.redpinkmain,
                    //                     ),
                    //                   ),
                    //                 ),
                    //               )
                    //             ],
                    //           )
                    //         ],
                    //       ),
                    //       SizedBox(height: 12.h),
                    //       Container(
                    //         width: 356.w,
                    //         height: 50.h,
                    //         decoration: BoxDecoration(
                    //           color: AppColors.bacround,
                    //           borderRadius: BorderRadius.circular(14),
                    //           border: Border.all(color: AppColors.redpink,
                    //               width: 1.2.w),
                    //         ),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //           children: [
                    //             Column(
                    //               mainAxisSize: MainAxisSize.min,
                    //               children: [
                    //                 Text(
                    //                   "15",
                    //                   style: TextStyle(
                    //                     color: Colors.white,
                    //                     fontSize: 16.sp,
                    //                     fontWeight: FontWeight.bold,
                    //                     height: 1.0,
                    //                   ),
                    //                 ),
                    //                 SizedBox(height: 1.h),
                    //                 Text(
                    //                   "recipes",
                    //                   style: TextStyle(
                    //                     color: Colors.white,
                    //                     fontSize: 12.sp,
                    //                     height: 1.0,
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //             Container(
                    //               height: 30.h,
                    //               width: 1.w,
                    //               color: AppColors.redpink,
                    //             ),
                    //             Column(
                    //               mainAxisSize: MainAxisSize.min,
                    //               children: [
                    //                 Text(
                    //                   "10",
                    //                   style: TextStyle(
                    //                     color: Colors.white,
                    //                     fontSize: 16.sp,
                    //                     fontWeight: FontWeight.bold,
                    //                     height: 1.0,
                    //                   ),
                    //                 ),
                    //                 SizedBox(height: 1.h),
                    //                 Text(
                    //                   "Following",
                    //                   style: TextStyle(
                    //                     color: Colors.white,
                    //                     fontSize: 12.sp,
                    //                     height: 1.0,
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //             Container(
                    //               height: 30.h,
                    //               width: 1.w,
                    //               color: AppColors.redpink,
                    //             ),
                    //             Column(
                    //               mainAxisSize: MainAxisSize.min,
                    //               children: [
                    //                 Text(
                    //                   "255.770",
                    //                   style: TextStyle(
                    //                     color: Colors.white,
                    //                     fontSize: 16.sp,
                    //                     fontWeight: FontWeight.bold,
                    //                     height: 1.0,
                    //                   ),
                    //                 ),
                    //                 SizedBox(height: 1.h),
                    //                 Text(
                    //                   "Followers",
                    //                   style: TextStyle(
                    //                     color: Colors.white,
                    //                     fontSize: 12.sp,
                    //                     height: 1.0,
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ],
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    //   SizedBox(
                    //     height: 12.71.h,
                    //   ),
                    //   Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: [
                    //       Text(
                    //         "Recipes",
                    //         style: TextStyle(color: Colors.white, fontSize: 12),
                    //       ),
                    //       SizedBox(
                    //         height: 4.h,
                    //       ),
                    //       Divider(
                    //         color: AppColors.redpinkmain,
                    //         height: 1.h,
                    //       ),
                    //       SizedBox(
                    //         height: 20.h,
                    //       ),
                    //       ChefsProfileRecipes(text: "Vegan Recipes",),
                    //       SizedBox(height: 12.h,),
                    //       ChefsProfileRecipes(text: "Asian Heritage",),
                    //       SizedBox(height: 12.h,),
                    //       ChefsProfileRecipes(text: "Guilty Pleasures",),
                    //     ],
                    //   ),
                    // ],
                  ),
                ),
            TopChefsProfileStatus.loading =>
                Center(
                  child: CircularProgressIndicator(),
                ),
            TopChefsProfileStatus.success => Text("sdecerc"),
            TopChefsProfileStatus.error => Center(
                  child: Text("errrrrorrrr"),
                ),
          };
        },
      ),
      // bottomNavigationBar: CommunityBottomBar(),
    );
  }
}

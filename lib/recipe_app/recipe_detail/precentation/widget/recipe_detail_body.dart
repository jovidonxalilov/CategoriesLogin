import 'package:cached_network_image/cached_network_image.dart';
import 'package:categorylogin/recipe_app/recipe_detail/precentation/widget/recipe_detail_instructions.dart';
import 'package:categorylogin/core/utils.dart';
import 'package:categorylogin/recipe_app/recipe_detail/precentation/widget/recipe_detail_video.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../view/recipe_detail_view_model.dart';

class RecipeDetailBody extends StatelessWidget {
  const RecipeDetailBody({
    super.key,
    required this.vm,
  });

  final RecipeDetailViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14, left: 30, right: 30),
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 210),
                    child: Container(
                      width: 356,
                      height: 65,
                      decoration: BoxDecoration(
                          color: AppColors.redpinkmain,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          SizedBox(width: 5),
                          Text(
                            vm.recipe.title,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(width: 20),
                          SvgPicture.asset(
                            "assets/yulduz.svg",
                            width: 10,
                            height: 10,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "4",
                            style: TextStyle(
                                color: AppColors.bacround, fontSize: 12),
                          ),
                          SizedBox(width: 8),
                          SvgPicture.asset(
                            "assets/sms.svg",
                            width: 10,
                            height: 10,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "28",
                            style: TextStyle(
                                color: AppColors.bacround, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 356,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: vm.recipe.photo,
                        width: double.infinity.w,
                        height: 358.h,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error, size: 50),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 85, left: 128),
                    child: Container(
                      width: 74,
                      height: 71,
                      decoration: BoxDecoration(
                          color: AppColors.redpinkmain,
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => RecipeDetailVideo(
                                    videoUrl: vm.recipe.videoRecipe,
                                ),
                              ),
                            );
                          },
                          child: SvgPicture.asset(
                            "assets/pauze.svg",
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      vm.recipe.user.profilePhoto,
                      width: 61,
                      height: 63,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    children: [
                      Text(
                        vm.recipe.user.username,
                        style: TextStyle(
                            color: AppColors.redpinkmain, fontSize: 14),
                      ),
                      Row(
                        children: [
                          Text(
                            vm.recipe.user.firstName,
                            style: TextStyle(
                                color: AppColors.redpinkmain, fontSize: 14),
                          ),
                          SizedBox(width: 3),
                          Text(
                            vm.recipe.user.lastName,
                            style: TextStyle(
                                color: AppColors.redpinkmain, fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 90,
                        height: 21,
                        decoration: BoxDecoration(
                          color: AppColors.redpink,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            "Following",
                            style: TextStyle(
                              color: AppColors.redpinkmain,
                              fontSize: 13,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 9),
                      SvgPicture.asset("assets/icons/three_dots.svg")
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 1,
                decoration: BoxDecoration(
                  color: AppColors.redpink,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                height: 31,
              ),
              Row(
                children: [
                  Text(
                    "Details",
                    style: TextStyle(
                      color: AppColors.redpinkmain,
                      fontSize: 20,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 15),
                  SvgPicture.asset(
                    "assets/icons/clock.svg",
                    color: Colors.white,
                    width: 14,
                    height: 14,
                  ),
                  SizedBox(width: 8),
                  Text(
                    vm.recipe.timeRequired.toString(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                vm.recipe.description,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 31,
              ),
              Text(
                "Ingredients",
                style: TextStyle(
                  color: AppColors.redpinkmain,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: vm.recipe.ingredients
                    .map(
                      (e) => Row(
                        children: [
                          Text(
                            "●",
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            "${e.amount}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 8),
                          Text(
                            "${e.name}",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
              SizedBox(height: 31),
              Text(
                "6 easy Steps",
                style: TextStyle(
                  color: AppColors.redpinkmain,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                ),
              ),
              SizedBox(height: 11),
              RecipeDetailInstructions(
                vm: vm,
                id: 1,
                colors: AppColors.pink,
              ),
              SizedBox(height: 11),
              RecipeDetailInstructions(
                vm: vm,
                id: 2,
                colors: AppColors.redpink,
              ),
              SizedBox(height: 11),
              RecipeDetailInstructions(
                vm: vm,
                id: 3,
                colors: AppColors.pink,
              ),
              SizedBox(height: 11),
              RecipeDetailInstructions(
                vm: vm,
                id: 4,
                colors: AppColors.redpink,
              ),
              SizedBox(height: 11),
              RecipeDetailInstructions(
                vm: vm,
                id: 5,
                colors: AppColors.pink,
              ),
              SizedBox(height: 11),
              RecipeDetailInstructions(
                vm: vm,
                id: 6,
                colors: AppColors.redpink,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:categorylogin/core/utils.dart';
import 'package:categorylogin/recipe_app/top_chef/data/model/chef_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopChefsSection extends StatelessWidget {
  const TopChefsSection({
    super.key,
    required this.name, required this.username, required this.photo,
  });

  final String name, username, photo;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 115, left: 5),
          child: Container(
            width: 160.w,
            height: 76.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.only(top: 14, left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(color: AppColors.bacround, fontSize: 11),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    username,
                    style: TextStyle(
                      color: AppColors.redpinkmain,
                      fontSize: 11,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "7777",
                        style: TextStyle(
                          color: AppColors.redpinkmain,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      SvgPicture.asset(
                        "assets/yulduz.svg",
                        width: 10,
                        height: 10,
                        color: AppColors.redpinkmain,
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      Container(
                        width: 43.w,
                        height: 17.h,
                        decoration: BoxDecoration(
                          color: AppColors.redpinkmain,
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Follow",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Container(
                        width: 13.w,
                        height: 13.h,
                        decoration: BoxDecoration(
                          color: AppColors.redpinkmain,
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/icons/share.svg",
                            width: 7.w,
                            height: 8.h,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            photo,
            width: 171.w,
            height: 153.h,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

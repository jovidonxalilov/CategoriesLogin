import 'package:categorylogin/recipe_app/home_page/presentation/view/home_page_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils.dart';

class YourRecipes extends StatelessWidget {
  const YourRecipes({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomePageViewModel>();
    return Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                vm.detail[id].photo,
                width: 168.w,
                height: 162,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 145),
              child: Container(
                width: 168.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Padding(
                  padding:
                  EdgeInsets.only(top: 5, left: 15),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        vm.detail[id].title,
                        style: TextStyle(
                            color: AppColors.bacround,
                            fontSize: 12),
                      ),
                      Row(
                        children: [
                          Text(
                            vm.detail[id].rating.toString(),
                            style: TextStyle(
                              color: AppColors.redpinkmain,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          SvgPicture.asset(
                            "assets/yulduz.svg",
                            width: 10.w,
                            height: 10.h,
                            color: AppColors.redpinkmain,
                          ),
                          SizedBox(
                            width: 26.w,
                          ),
                          SvgPicture.asset(
                            "assets/icons/clock.svg",
                            width: 11.w,
                            height: 11.h,
                            fit: BoxFit.cover,
                            color: AppColors.redpinkmain,
                          ),
                          SizedBox(
                            width: 6.5,
                          ),
                          Text(
                            '${vm.detail[id].timeRequired} min'
                                .toString(),
                            style: TextStyle(
                              color: AppColors.redpinkmain,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 125),
              child: Container(
                width: 24.w,
                height: 24.h,
                decoration: BoxDecoration(
                  color: AppColors.redpinkmain,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: SvgPicture.asset("assets/icons/heart.svg", color: Colors.white,),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

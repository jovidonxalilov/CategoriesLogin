import 'package:categorylogin/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChefsProfileRecipes extends StatelessWidget {
  const ChefsProfileRecipes({
    super.key, required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 72),
          child: Align(
            alignment: Alignment.center,
            child: Container(
              width: 330.w,
              height: 50.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.redpinkmain,
                  width: 1,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  text,
                  style: TextStyle(
                    color: AppColors.bacround,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
        Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(20),
          shadowColor: Colors.black.withOpacity(1),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assets/osh.jpg",
              width: double.infinity.w,
              height: 103.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}

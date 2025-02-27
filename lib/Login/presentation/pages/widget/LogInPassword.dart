import 'package:categorylogin/utils.dart';
import 'package:flutter/material.dart';

class CategoryPageColumn extends StatelessWidget {
  const CategoryPageColumn({
    super.key,
    required this.controller, required this.hint, required this.title,
  });
  final String hint, title;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 15),
        SizedBox(
          width: 357,
          height: 41,
          child: TextFormField(
            controller: controller,
            style: TextStyle(color: AppColors.black),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.pink,
              hintText: hint,
              hintStyle: TextStyle(
                  fontSize: 16,
                  color: AppColors.black.withValues(alpha: 0.45),
                  fontWeight: FontWeight.w500),
              contentPadding: EdgeInsets.symmetric(horizontal: 36),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

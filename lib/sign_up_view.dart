import 'package:categorylogin/utils.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key, required this.title, required this.page});

  final String title, page;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          page,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 10),
        TextFormField(
          style: TextStyle(color: AppColors.black),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.pink,
            hintText: title,
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
      ],
    );
  }
}

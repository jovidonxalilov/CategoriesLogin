import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils.dart';
import '../../view/create_reviews/create_reviews_bloc.dart';

class CreateReviewReviewSection extends StatelessWidget {
  const CreateReviewReviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: 4,
      maxLines: 4,
      controller: context.read<CreateReviewBloc>().reviewController,
      style: TextStyle(
        color: AppColors.bacround,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        hintText: "Leave us Review",
        hintStyle: TextStyle(
          color: AppColors.bacround.withValues(alpha: 0.45),
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: AppColors.pink,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 16,
        ),
        border: OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../../core/utils.dart';
import '../../../../common/presentation/widgets/recipe_text_button_container.dart';
import '../../view/create_reviews/create_review_event.dart';
import '../../view/create_reviews/create_reviews_bloc.dart';


class CreateReviewCancelAndSubmitSection extends StatelessWidget {
  const CreateReviewCancelAndSubmitSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20.w,
      children: [
        RecipeTextButtonContainer(
          text: "Cancel",
          textColor: AppColors.redpink,
          containerColor: AppColors.pink,
          containerWidth: 168.w,
          containerHeight: 29.h,
          callback: () => context.pop(),
        ),
        RecipeTextButtonContainer(
          text: "Submit",
          textColor: Colors.white,
          containerColor: AppColors.redpinkmain,
          containerWidth: 168.w,
          containerHeight: 29.h,
          callback: () => context.read<CreateReviewBloc>().add(CreateReviewSubmit()),
        ),
      ],
    );
  }
}

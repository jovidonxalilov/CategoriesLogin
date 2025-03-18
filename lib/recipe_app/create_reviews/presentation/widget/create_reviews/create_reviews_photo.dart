import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils.dart';
import '../../view/create_reviews/create_review_event.dart';
import '../../view/create_reviews/create_reviews_bloc.dart';
import '../../view/create_reviews/create_reviews_state.dart';

class CreateReviewAddPhotoSection extends StatelessWidget {
  const CreateReviewAddPhotoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox.fromSize(
              size: Size(21.w, 21.h),
              child: IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.pink,
                  padding: EdgeInsets.zero,
                ),
                color: AppColors.redpinkmain,
                onPressed: () async => context
                    .read<CreateReviewBloc>()
                    .add(CreateReviewPickImage()),
                iconSize: 18,
                icon: Icon(Icons.add),
              ),
            ),
            Text("Add photo", style: TextStyle(color: Colors.white),),
          ],
        ),
        SizedBox(height: 5),
        BlocBuilder<CreateReviewBloc, CreateReviewState>(
          builder: (context, state) {
            if (state.pickedImage != null) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Image.file(
                  state.pickedImage!,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}

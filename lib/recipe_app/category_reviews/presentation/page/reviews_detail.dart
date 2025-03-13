import 'package:categorylogin/core/utils.dart';
import 'package:categorylogin/recipe_app/category_reviews/presentation/page/reviews_detail_body.dart';
import 'package:categorylogin/recipe_app/category_reviews/presentation/widget/categories_reviews_comments.dart';
import 'package:categorylogin/recipe_app/community/presentation/widget/community_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../view/reviews_bloc.dart';
import '../view/reviews_state.dart';

class ReviewsDetail extends StatelessWidget {
  const ReviewsDetail({super.key});
  @override
  Widget build(BuildContext context) {
    // final vm = context.watch<ReviewsViewModel>();
    // if (vm.isLoading) {
    //   return const Center(child: CircularProgressIndicator());
    // }
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.bacround,
      appBar: AppBar(
        backgroundColor: AppColors.bacround,
        toolbarHeight: 50,
        leading: Center(child: SvgPicture.asset("assets/back.svg")),
        title: Center(
          child: Text(
            "Reviews",
            style: TextStyle(
              color: AppColors.redpinkmain,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: BlocBuilder<ReviewsBloc, ReviewsState>(
        builder: (context, state) {
          return switch (state.status) {
            ReviewsStatus.idle => ListView(
                children: [
                  ReviewsDetailBody(state: state,),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.commentModel!.length,
                        itemBuilder:(context, index) =>  CategoriesReviewsComments(
                          comment: state.commentModel![index],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ReviewsStatus.loading => Center(
                child: CircularProgressIndicator(),
              ),
            ReviewsStatus.error => Center(
                child: Text("Something wrong?!..."),
              ),
          };
        },
      ),
      bottomNavigationBar: CommunityBottomBar(),
    );
  }
}

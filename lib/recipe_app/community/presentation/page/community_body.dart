import 'package:categorylogin/core/utils.dart';
import 'package:categorylogin/recipe_app/common/presentation/widgets/recipe_bottom_navigation_bar.dart';
import 'package:categorylogin/recipe_app/community/presentation/view/community_view_model.dart';
import 'package:categorylogin/recipe_app/community/presentation/widget/community_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/presentation/widgets/recipe_app_bar.dart';
import '../../../common/presentation/widgets/recipe_icon_button_container.dart';

class CommunityBody extends StatelessWidget {
  const CommunityBody({super.key});


  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CommunityViewModel>();
    if(vm.isLoading){
      return Center(child: CircularProgressIndicator(),);
    }return Scaffold(
      backgroundColor: AppColors.bacround,
      appBar: RecipeAppBar(
        title: "Community",
        actions: [
          RecipeIconButtonContainer(
            image: "assets/notifaction.svg",
            callback: () {},
            iconWidth: 12,
            iconHeight: 18,
          ),
          SizedBox(width: 5),
          RecipeIconButtonContainer(
            image: "assets/search.svg",
            callback: () {},
            iconWidth: 12,
            iconHeight: 18,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: vm.community.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Image.network(vm.community[2].photo, width: 100, height: 100,),
              Center(child: Text(vm.community[4].description, style: TextStyle(color: Colors.white))),
            ],
          );
        },
      ),
      bottomNavigationBar: CommunityBottomBar(),
    );

  }
}

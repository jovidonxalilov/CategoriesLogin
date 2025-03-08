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

    if (vm.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
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
          const SizedBox(width: 5),
          RecipeIconButtonContainer(
            image: "assets/search.svg",
            callback: () {},
            iconWidth: 12,
            iconHeight: 18,
          ),
        ],
      ),
      body: vm.community.isEmpty
          ? const Center(child: Text("Ma'lumot mavjud emas", style: TextStyle(color: Colors.white)))
          : ListView.builder(
        itemCount: vm.community.length,
        itemBuilder: (context, index) {
          final recipe = vm.community[index];

          return Column(
            children: [
              Image.network(
                recipe.photo ?? '',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.broken_image, size: 100, color: Colors.grey);
                },
              ),
              Center(
                child: Text(
                  recipe.description ?? "Tavsif mavjud emas",
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              const Divider(color: Colors.white),
            ],
          );
        },
      ),
      bottomNavigationBar: CommunityBottomBar(),
    );
  }
}

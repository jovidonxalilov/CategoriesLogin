import 'dart:developer';
import 'package:categorylogin/core/rout/routes.dart';
import 'package:categorylogin/recipe_app/community/presentation/page/community_body.dart';
import 'package:categorylogin/recipe_app/community/presentation/view/community_view_model.dart';
import 'package:categorylogin/recipe_app/home_page/presentation/page/home_view.dart';
import 'package:categorylogin/recipe_app/home_page/presentation/view/home_page_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../recipe_app/Login/presentation/login_view.dart';
import '../../recipe_app/Login/presentation/view/login_view_model.dart';
import '../../recipe_app/categories/data/models/category_model.dart';
import '../../recipe_app/categories/presentation/page/category_view.dart';
import '../../recipe_app/categories/presentation/view_model/categories_view_model.dart';
import '../../recipe_app/category_detail/presentation/page/category_detail_view.dart';
import '../../recipe_app/category_detail/presentation/view/categoy_view_model.dart';
import '../../recipe_app/community/data/model/community_model.dart';
import '../../recipe_app/community/data/repository/community_repository.dart';
import '../../recipe_app/recipe_detail/precentation/page/recipe_detail.dart';
import '../../recipe_app/recipe_detail/precentation/view/recipe_detail_view_model.dart';

final router = GoRouter(
  initialLocation: Routes.community,
  routes: [
    GoRoute(
      path: Routes.categories,
      builder: (context, state) => CategoriesView(
        vm: CategoriesViewModel(catRepo: context.read()),
      ),
    ),
    GoRoute(
      path: Routes.home,
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) {
          return HomePageViewModel(
            recipeRepo: context.read(),
            catRepo: context.read(),
            repo: context.read(),
          );
        },
        child: HomePageView(),
      ),
    ),
    GoRoute(
      path: Routes.recipeDetail,
      builder: (context, state) {
        final recipeIdStr = state.pathParameters['recipeId'];
        final recipeId = int.tryParse(recipeIdStr ?? '') ?? 1;
        return ChangeNotifierProvider(
          create: (context) => RecipeDetailViewModel(
            recipeRepo: context.read(),
            recipeId: recipeId,
          ),
          child: RecipeDetailPage(),
        );
      },
    ),

    GoRoute(
      path: Routes.login,
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => LoginViewModel(
          repo: context.read(),
        ),
        child: LoginView(),
      ),
    ),
    GoRoute(
      path: Routes.categoryDetail,
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) {
          log("state ${state.extra}");
          return CategoryDetailViewModel(
            catRepo: context.read(),
            recipeRepo: context.read(),
            selected: CategoryModel(
                id: 1, title: "title", image: "image", main: true),
          )..load();
        },
        child: CategoryDetailView(),
      ),
    ),
    GoRoute(
      path: Routes.community,
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => CommunityViewModel(
          communityRepo: context.read(), order: 'rating', descending: true, limit: 30,
        ),
        child: CommunityBody(),
      ),
    )
  ],
);

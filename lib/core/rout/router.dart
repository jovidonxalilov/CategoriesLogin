import 'dart:developer';
import 'package:categorylogin/core/rout/routes.dart';
import 'package:categorylogin/recipe_app/home_page/presentation/page/home_view.dart';
import 'package:categorylogin/recipe_app/home_page/presentation/view/home_page_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../recipe_app/Login/presentation/login_view.dart';
import '../../recipe_app/Login/presentation/view/login_view_model.dart';
import '../../recipe_app/categories/data/models/category_model.dart';
import '../../recipe_app/categories/presentation/page/category_view.dart';
import '../../recipe_app/categories/presentation/view_model/categories_view_model.dart';
import '../../recipe_app/recipe_detail/precentation/page/recipe_detail.dart';
import '../../recipe_app/recipe_detail/precentation/view/recipe_detail_view_model.dart';

final router = GoRouter(
  initialLocation: '/category-detail',
  routes: [
    GoRoute(
      path: Routes.categories,
      builder: (context, state) => CategoriesView(
        vm: CategoriesViewModel(catRepo: context.read()),
      ),
    ),
    GoRoute(
      path: Routes.categoryDetail,
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) {
          log("state ${state.extra}");
          return HomePageViewModel(
            catRepo: context.read(),
            recipeRepo: context.read(),
            selected: state.extra as CategoryModel,
          )..load();
        },
        child: HomePageView(),
      ),
    ),
    GoRoute(
      path: Routes.recipeDetail,
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => RecipeDetailViewModel(
          recipeRepo: context.read(),
          recipeId: int.parse(state.pathParameters['recipeId']!), // casting
        ),
        child: RecipeDetailPage(),
      ),
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
    // GoRoute(
    //   path: Routes.home,
    //   builder: (context, state) => ChangeNotifierProvider(
    //     create: (context) {
    //       log("state ${state.extra}");
    //       return HomePageViewModel(
    //         catRepo: context.read(),
    //         recipeRepo: context.read(),
    //         selected: state.extra as CategoryModel,
    //       )..load();
    //     },
    //     child: CategoryDetail(),
    //   ),
    // ),
  ],
);

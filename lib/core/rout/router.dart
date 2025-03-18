import 'dart:developer';
import 'package:categorylogin/core/rout/routes.dart';
import 'package:categorylogin/recipe_app/categories/data/repository/categories_repository.dart';
import 'package:categorylogin/recipe_app/categories/data/state/categories_cubit.dart';
import 'package:categorylogin/recipe_app/create_reviews/presentation/page/create_reviews_view.dart';
import 'package:categorylogin/recipe_app/category_reviews/presentation/page/reviews_detail.dart';
import 'package:categorylogin/recipe_app/create_reviews/presentation/view/create_reviews/create_review_event.dart';
import 'package:categorylogin/recipe_app/create_reviews/presentation/view/create_reviews/create_reviews_bloc.dart';
import 'package:categorylogin/recipe_app/category_reviews/presentation/view/reviews_bloc.dart';
import 'package:categorylogin/recipe_app/community/presentation/page/community_body.dart';
import 'package:categorylogin/recipe_app/community/presentation/view/community_view_model.dart';
import 'package:categorylogin/recipe_app/home_page/presentation/page/home_view.dart';
import 'package:categorylogin/recipe_app/home_page/presentation/view/home_page_view_model.dart';
import 'package:categorylogin/recipe_app/misol/set_state.dart';
import 'package:categorylogin/recipe_app/top_chef/presentation/page/top_chefs_detail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../recipe_app/Login/presentation/login_view.dart';
import '../../recipe_app/Login/presentation/view/login_view_model.dart';
import '../../recipe_app/categories/data/models/category_model.dart';
import '../../recipe_app/categories/presentation/page/category_view.dart';
import '../../recipe_app/category_detail/presentation/page/category_detail_view.dart';
import '../../recipe_app/category_detail/presentation/view/categoy_view_model.dart';
import '../../recipe_app/recipe_detail/precentation/page/recipe_detail.dart';
import '../../recipe_app/recipe_detail/precentation/view/recipe_detail_view_model.dart';

final router = GoRouter(
  initialLocation: Routes.topChefs,
  routes: [
    GoRoute(
      path: Routes.state,
      builder: (context, state) => Misol(),
    ),
    GoRoute(
      path: Routes.categories,
      builder: (context, state) => BlocProvider(
        create: (context) => CategoriesBloc(
          catRepo: context.read<CategoryRepository>(),
        ),
        child: CategoriesView(),
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
            chefs: context.read(),
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
          communityRepo: context.read(),
          order: 'rating',
          descending: true,
          limit: 30,
        ),
        child: CommunityBody(),
      ),
    ),
    GoRoute(
      path: Routes.topChefs,
      builder: (context, state) => TopChefsDetail(),
    ),
    GoRoute(
      path: Routes.reView,
      builder: (context, state) => BlocProvider(
          create: (context) => ReviewsBloc(
                recipeRepo: context.read(),
                recipeId: int.parse(state.pathParameters['recipeId']!),
              ),
          child: ReviewsDetail(),
      ),
    ),
    GoRoute(
      path: Routes.createReview,
      builder: (context, state) => BlocProvider(
        create: (context) => CreateReviewBloc(
          recipeRepo: context.read(),
          reviewRepo: context.read(),
        )..add(CreateReviewLoading(recipeId: int.parse(state.pathParameters['recipeId']!))),
        child: CreateReviewsView(),
      ),
    )
  ],
);

import 'package:categorylogin/recipe_app/community/data/repository/community_repository.dart';
import 'package:categorylogin/recipe_app/home_page/data/repository/home_page_repository.dart';
import 'package:categorylogin/recipe_app/home_page/data/repository/recipe_top_chefs_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../recipe_app/categories/data/repository/categories_repository.dart';
import '../recipe_app/category_detail/data/repository/category_detail_repository.dart';
import 'client.dart';

final List<SingleChildWidget> providers = [
  Provider(
    create: (context) => ApiClient(),
  ),
  Provider(
    create: (context) => CategoryRepository(client: context.read()),
  ),
  Provider(
    create: (context) => CategoryDetailRepository(client: context.read()),
  ),
  Provider(
    create: (context) => CommunityRepository(
      client: context.read(),
    ),
  ),
  Provider(
    create: (context) => HomePageRepository(
      client: context.read(),
    ),
  ),
  Provider(
    create: (context) => TopChefsRepository(
      client: context.read(),
    ),
  ),
];

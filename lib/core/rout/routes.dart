class Routes{
  static const String categories = '/categories';
  static const String categoryDetail = '/category-detail';
  static const String recipeDetail = '/recipe-detail/:recipeId';
  static const String login = '/login-detail';
  static const String home = '/home-page';
  static const String community = '/community';
  static const String state = '/state';
  static const String reviews = '/reviews';
  static const String reView='/reviews/:recipeId';
  static const String topChefs = '/topChefs';
  static String getCreateReview(int recipeId) => '/create-review/$recipeId';
  static String getReviewsDetail(int recipeId) => '/reviews/$recipeId';
  static const String createReview = '/create-review/:recipeId';
  static const String trendingRecipe = '/trending-recipe';
  static const String chefsProfile = '/chefs-profile';
}
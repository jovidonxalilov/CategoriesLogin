// import 'package:categorylogin/recipe_app/category_reviews/data/model/reviews_model.dart';
// import 'package:categorylogin/recipe_app/category_reviews/data/repository/categories_reviews_repository.dart';
// import 'package:flutter/widgets.dart';
//
// class ReviewsViewModel extends ChangeNotifier {
//   ReviewsViewModel({
//     required ReviewsRepository repo,
//     required this.id,
//   }) : _repo = repo {
//     load();
//   }
//
//   final int id;
//   final ReviewsRepository _repo;
//   Map<String, ReviewsModel> reviews = {}; // ✅ endi `ReviewsModel` bo‘ladi
//   ReviewsModel? reviewsDetail;
//   bool isLoading = true;
//
//   Future<void> load() async {
//     try {
//       isLoading = true;
//       notifyListeners();
//
//       final fetchReviews = await _repo.fetchReviews(id);
//
//       if (fetchReviews.isNotEmpty) {
//         reviews = fetchReviews;
//         reviewsDetail = reviews.values.first; // ✅ endi to‘g‘ri ishlaydi
//       } else {
//         reviews = {}; // Bo‘sh map
//         reviewsDetail = null;
//       }
//     } catch (e) {
//       print("Xatolik yuz berdi: $e");
//       reviews = {};
//       reviewsDetail = null;
//     } finally {
//       isLoading = false;
//       notifyListeners();
//     }
//   }
// }
//
//

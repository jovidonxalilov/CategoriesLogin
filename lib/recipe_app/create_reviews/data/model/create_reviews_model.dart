import 'dart:io';

import 'package:dio/dio.dart';

class CreateReviewsModel {
  final int recipeId;
  final String comment;
  final int rating;
  final bool recommend;
  final File? photo;

  CreateReviewsModel({
    required this.comment,
    required this.rating,
    required this.photo,
    required this.recipeId,
    required this.recommend,
  });

  Future<Map<String, dynamic>> toJson() async {
    return {
      "recipeId": recipeId,
      "comment": comment,
      "rating": rating,
      "recommend": recommend,
      "image": photo != null
          ? await MultipartFile.fromFile(photo!.path,
              filename: photo!.path.split('/').last)
          : null,
    };
  }
}

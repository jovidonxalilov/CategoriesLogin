import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../data/model/reviews_comment_model.dart';
import '../../data/model/reviews_model.dart';

enum ReviewsStatus { idle, loading, error }

@immutable
class ReviewsState extends Equatable {
  final ReviewsStatus status;
  final List<ReviewsCommentsModel>? commentModel;
  final ReviewsModel? recipeModel;

  const ReviewsState({
    required this.recipeModel,
    required this.status,
    required this.commentModel,
  });

  ReviewsState copyWith({
    ReviewsModel? recipeModel,
    List<ReviewsCommentsModel>? comment,
    ReviewsStatus? status,
  }) {
    return ReviewsState(
      recipeModel: recipeModel ?? this.recipeModel,
      commentModel: comment ?? this.commentModel,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [recipeModel, status,commentModel];
}
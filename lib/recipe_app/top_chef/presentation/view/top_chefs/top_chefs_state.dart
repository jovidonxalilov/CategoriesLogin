import 'package:equatable/equatable.dart';

import '../../../data/model/chef_model.dart';


enum TopChefsStatus { idle, loading, success, error }

class TopChefsState extends Equatable {
  final TopChefsStatus status;
  final List<TopChefModel> mostViewedChefs;
  final TopChefsStatus mostViewedChefsStatus;
  final List<TopChefModel> mostLikedChefs;
  final TopChefsStatus mostLikedChefsStatus;
  final List<TopChefModel> newChefs;
  final TopChefsStatus newChefsStatus;

  const TopChefsState({
    required this.mostViewedChefs,
    required this.mostLikedChefs,
    required this.newChefs,
    required this.mostViewedChefsStatus,
    required this.mostLikedChefsStatus,
    required this.newChefsStatus,
    required this.status
  });

  factory TopChefsState.initial() {
    return TopChefsState(
      mostViewedChefs: [],
      mostLikedChefs: [],
      newChefs: [],
      mostViewedChefsStatus: TopChefsStatus.idle,
      mostLikedChefsStatus: TopChefsStatus.idle,
      newChefsStatus: TopChefsStatus.idle,
      status: TopChefsStatus.loading,
    );
  }

  TopChefsState copyWith({
    List<TopChefModel>? mostViewedChefs,
    List<TopChefModel>? mostLikedChefs,
    List<TopChefModel>? newChefs,
    TopChefsStatus? mostViewedChefsStatus,
    TopChefsStatus? mostLikedChefsStatus,
    TopChefsStatus? newChefsStatus,
    TopChefsStatus? status,
  }) {
    return TopChefsState(
      mostViewedChefs: mostViewedChefs ?? this.mostViewedChefs,
      mostViewedChefsStatus: mostViewedChefsStatus ?? this.mostViewedChefsStatus,
      mostLikedChefs: mostLikedChefs ?? this.mostLikedChefs,
      mostLikedChefsStatus: mostLikedChefsStatus ?? this.mostLikedChefsStatus,
      newChefs: newChefs ?? this.newChefs,
      newChefsStatus: newChefsStatus ?? this.newChefsStatus,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
    mostViewedChefs,
    mostLikedChefs,
    newChefs,
    mostViewedChefsStatus,
    mostLikedChefsStatus,
    newChefsStatus,
  ];
}


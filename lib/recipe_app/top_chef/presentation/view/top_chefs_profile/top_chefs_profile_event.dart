sealed class TopChefsProfileEvent {}

final class TopChefsProfileLoading extends TopChefsProfileEvent {
  final int id;
  TopChefsProfileLoading({required this.id});
}
class TopRatedState {}

class TopRatedInitial extends TopRatedState {}

class TopRatedLoading extends TopRatedState {}

class TopRatedSuccess extends TopRatedState {}

class TopRatedError extends TopRatedState {
  final String message;
  TopRatedError({required this.message});
}

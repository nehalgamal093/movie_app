part of 'similar_movies_cubit.dart';

abstract class SimilarMoviesState {}

class SimilarMoviesInitial extends SimilarMoviesState {}

class SimilarMoviesLoading extends SimilarMoviesState {}

class SimilarMoviesSuccess extends SimilarMoviesState {}

class SimilarMoviesError extends SimilarMoviesState {
  final String message;
  SimilarMoviesError({required this.message});
}

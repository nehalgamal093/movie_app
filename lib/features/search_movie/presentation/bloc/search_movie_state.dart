part of 'search_movie_cubit.dart';

class SearchMovieState {}

final class SearchMovieInitial extends SearchMovieState {}

final class SearchMovieLoadingState extends SearchMovieState {}

final class SearchMovieSuccessState extends SearchMovieState {
  MoviesModel moviesModel;
  SearchMovieSuccessState({required this.moviesModel});
}

final class SearchMovieErrorState extends SearchMovieState {
  AppFailures failures;
  SearchMovieErrorState({required this.failures});
}

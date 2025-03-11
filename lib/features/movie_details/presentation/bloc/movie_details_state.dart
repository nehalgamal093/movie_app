part of 'movie_details_cubit.dart';

sealed class MovieDetailsState {}

final class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoadingState extends MovieDetailsState {}

class MovieDetailsSuccessState extends MovieDetailsState {
  MovieModel movieModel;
  MovieDetailsSuccessState({required this.movieModel});
}

class MovieDetailsErrorState extends MovieDetailsState {
  AppFailures failures;
  MovieDetailsErrorState({required this.failures});
}

class MovieImagesLoadingState extends MovieDetailsState {}

class MovieImagesSuccessState extends MovieDetailsState {
  MovieImages images;
  MovieImagesSuccessState({required this.images});
}

class MovieImagesErrorState extends MovieDetailsState {
  AppFailures failures;
  MovieImagesErrorState({required this.failures});
}

class SimilarMoviesLoadingState extends MovieDetailsState {}

class SimilarMoviesSuccessState extends MovieDetailsState {
  MoviesModel movies;
  SimilarMoviesSuccessState({required this.movies});
}

class SimilarMoviesErrorState extends MovieDetailsState {
  AppFailures failures;
  SimilarMoviesErrorState({required this.failures});
}

class CreditsLoadingState extends MovieDetailsState {}

class CreditsSuccessState extends MovieDetailsState {
  CreditModel credits;
  CreditsSuccessState({required this.credits});
}

class CreditsErrorState extends MovieDetailsState {
  AppFailures failures;
  CreditsErrorState({required this.failures});
}
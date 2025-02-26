part of 'browse_cubit.dart';

abstract class BrowseState {}

final class BrowseInitial extends BrowseState {}

class GenresLoadingState extends BrowseState {}

class GenresSuccessState extends BrowseState {
  GenresModel genres;
  GenresSuccessState({required this.genres});
}

class GenresErrorState extends BrowseState {
  AppFailures failures;
  GenresErrorState({required this.failures});
}

class ChangeGenresSuccess extends BrowseState {}

class MoviesByGenresLoadingState extends BrowseState {}

class MoviesByGenresSuccessState extends BrowseState {
  MoviesModel movies;
  MoviesByGenresSuccessState({required this.movies});
}

class MoviesByGenresErrorState extends BrowseState {
  AppFailures failures;
  MoviesByGenresErrorState({required this.failures});
}

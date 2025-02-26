part of 'home_cubit.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}

final class PopularMoviesLoading extends HomeState {}

final class PopularMoviesSuccess extends HomeState {
  MoviesModel popularMovies;
  PopularMoviesSuccess({required this.popularMovies});
}

final class PopularMoviesError extends HomeState {
  final AppFailures failures;
  PopularMoviesError({required this.failures});
}

final class TopRatedMoviesLoading extends HomeState {}

final class TopRatedMoviesSuccess extends HomeState {
  MoviesModel topRatedMovies;
  TopRatedMoviesSuccess({required this.topRatedMovies});
}

final class TopRatedMoviesError extends HomeState {
  final AppFailures failures;
  TopRatedMoviesError({required this.failures});
}

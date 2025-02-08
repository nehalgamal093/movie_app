part of 'movie_search_cubit.dart';

abstract class MovieSearchState {}

class MovieSearchInitial extends MovieSearchState {}

class MovieSearchLoading extends MovieSearchState {}

class MovieSearchSuccess extends MovieSearchState {}

class MovieSearchError extends MovieSearchState {
  final String message;
  MovieSearchError({required this.message});
}

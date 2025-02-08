part of 'movie_credits_cubit.dart';

abstract class MovieCreditsState {}

final class MovieCreditsInitial extends MovieCreditsState {}

final class MovieCreditsLoading extends MovieCreditsState {}

final class MovieCreditsSuccess extends MovieCreditsState {}

final class MovieCreditsError extends MovieCreditsState {
  final String message;
  MovieCreditsError({required this.message});
}

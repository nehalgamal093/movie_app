part of 'favorite_movies_cubit.dart';


abstract class FavoriteMoviesState {}

final class FavoriteMoviesInitial extends FavoriteMoviesState {}


final class FavoriteMoviesLoading extends FavoriteMoviesState {}
final class FavoriteMoviesSuccess extends FavoriteMoviesState {}
final class FavoriteMoviesError extends FavoriteMoviesState {
  final String message;
  FavoriteMoviesError({required this.message});
}


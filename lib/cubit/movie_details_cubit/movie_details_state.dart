abstract class MovieDetailsState {}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsSuccess extends MovieDetailsState {}

class MovieDetailsError extends MovieDetailsState {
  final String message;
  MovieDetailsError({required this.message});
}
final class ChangeFavoriteSuccess extends MovieDetailsState {}
final class AddFavoriteMoviesLoading extends MovieDetailsState {}

final class AddFavoriteMoviesSuccess extends MovieDetailsState {}

final class AddFavoriteMoviesError extends MovieDetailsState {
  final String message;
  AddFavoriteMoviesError({required this.message});
}

final class IsMovieFavoriteLoading extends MovieDetailsState {}

final class IsMovieFavoriteSuccess extends MovieDetailsState {}

final class IsMovieFavoriteError extends MovieDetailsState {
  final String message;
  IsMovieFavoriteError({required this.message});
}
final class DeleteMovieLoading extends MovieDetailsState {}

final class DeleteMovieSuccess extends MovieDetailsState {}

final class DeleteMovieError extends MovieDetailsState {
  final String message;
  DeleteMovieError({required this.message});
}
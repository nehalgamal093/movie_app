class GenresMoviesState {}

class GenresMoviesInitial extends GenresMoviesState {}

class GenresMoviesLoading extends GenresMoviesState {}

class GenresMoviesSuccess extends GenresMoviesState {}

class GenresMoviesError extends GenresMoviesState {
  final String message;
  GenresMoviesError({required this.message});
}

class MoviesLoading extends GenresMoviesState {}

class MoviesSuccess extends GenresMoviesState {}

class MoviesError extends GenresMoviesState {
  final String message;
  MoviesError({required this.message});
}
class SelectedGenreSuccess extends GenresMoviesState {}
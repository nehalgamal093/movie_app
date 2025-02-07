class PopularMoviesState {}

class PopularMoviesInitial extends PopularMoviesState {}

class PopularMoviesLoading extends PopularMoviesState {}

class PopularMoviesSuccess extends PopularMoviesState {}

class PopularMoviesError extends PopularMoviesState {
 final String message;
 PopularMoviesError({required this.message});
}

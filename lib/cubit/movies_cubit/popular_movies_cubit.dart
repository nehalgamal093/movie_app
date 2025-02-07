import 'package:bloc/bloc.dart';
import 'package:movies_app/cubit/movies_cubit/popular_movies_state.dart';
import 'package:movies_app/models/MoviesResponse.dart';
import 'package:movies_app/repository/popular_movies/movies_repo.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  MoviesResponse? moviesResponse;
  PopularMoviesRepo popularMoviesRepo;
  PopularMoviesCubit(this.popularMoviesRepo) : super(PopularMoviesInitial());

  void getPopularMovies() async {
    try {
      emit(PopularMoviesLoading());
      moviesResponse = await popularMoviesRepo.getPopularMovies();

      emit(PopularMoviesSuccess());
    } catch (error) {
      emit(PopularMoviesError(message: error.toString()));
    }
  }
}

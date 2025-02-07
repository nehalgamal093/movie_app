import 'package:bloc/bloc.dart';
import 'package:movies_app/cubit/movies_cubit/popular_movies_state.dart';
import 'package:movies_app/cubit/top_rated_cubit/top_rated_state.dart';
import 'package:movies_app/models/MoviesResponse.dart';
import 'package:movies_app/repository/popular_movies/movies_repo.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  MoviesResponse? moviesResponse;
  PopularMoviesRepo popularMoviesRepo;
  TopRatedCubit(this.popularMoviesRepo) : super(TopRatedInitial());

  void getTopRated() async {
    try {
      emit(TopRatedLoading());
      moviesResponse = await popularMoviesRepo.getTopRatedMovies();

      emit(TopRatedSuccess());
    } catch (error) {
      emit(TopRatedError(message: error.toString()));
    }
  }
}

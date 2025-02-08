import 'package:bloc/bloc.dart';
import 'package:movies_app/models/MoviesResponse.dart';
import 'package:movies_app/repository/similar_movies_repo/similar_movies_repo.dart';

part 'similar_movies_state.dart';

class SimilarMoviesCubit extends Cubit<SimilarMoviesState> {
  MoviesResponse? moviesResponse;
  SimilarMoviesRepo similarMoviesRepo;
  SimilarMoviesCubit(this.similarMoviesRepo) : super(SimilarMoviesInitial());

  void getSimilarMovies(String id) async {
    try {
      emit(SimilarMoviesLoading());
      moviesResponse = await similarMoviesRepo.getSimilarMovies(id);
      emit(SimilarMoviesSuccess());
    } catch (error) {
      emit(SimilarMoviesError(message: error.toString()));
    }
  }
}

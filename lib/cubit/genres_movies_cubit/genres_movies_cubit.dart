import 'package:bloc/bloc.dart';
import 'package:movies_app/models/GenresResponse.dart';
import 'package:movies_app/models/MoviesResponse.dart';
import 'package:movies_app/repository/movies_genres_repo/movie_genres_repo.dart';
import 'genres_movies_state.dart';

class GenresMoviesCubit extends Cubit<GenresMoviesState> {
  MoviesResponse? moviesResponse;
  GenresResponse? genresResponse;
  MovieGenresRepo genresMoviesRepo;
  GenresMoviesCubit(this.genresMoviesRepo) : super(GenresMoviesInitial());
  int index = 0;

  void changeIndex(int selectedIndex) async{
    index = selectedIndex;
    await getMovies();
    emit(SelectedGenreSuccess());
  }

  void getGenres() async {
    try {
      emit(GenresMoviesLoading());
      genresResponse = await genresMoviesRepo.getGenres();
      await getMovies();
      emit(GenresMoviesSuccess());
    } catch (error) {
      emit(GenresMoviesError(message: error.toString()));
    }
  }

  Future<void> getMovies() async {
    try {
      emit(MoviesLoading());
      moviesResponse = await genresMoviesRepo
          .getMovies(genresResponse!.genres![index].id!.toString());

      emit(MoviesSuccess());
    } catch (error) {
      emit(MoviesError(message: error.toString()));
    }
  }
}

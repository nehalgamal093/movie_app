import 'package:bloc/bloc.dart';
import 'package:movies_app/models/MoviesResponse.dart';
import 'package:movies_app/models/favorite_movies.dart';
import 'package:movies_app/repository/fav_movies_repo/fav_movie_repo.dart';

part 'favorite_movies_state.dart';

class FavoriteMoviesCubit extends Cubit<FavoriteMoviesState> {
  FavoriteMovies? favoriteMovies;
  FavoriteMovieRepo favoriteMovieRepo;
  FavoriteMoviesCubit(this.favoriteMovieRepo) : super(FavoriteMoviesInitial());

  void getFavoriteMovies() async {
    try {
      emit(
        FavoriteMoviesLoading(),
      );
      favoriteMovies = await favoriteMovieRepo.getFavoriteMovies();
      emit(
        FavoriteMoviesSuccess(),
      );
    } catch (error) {
      emit(
        FavoriteMoviesError(
          message: error.toString(),
        ),
      );
    }
  }
}

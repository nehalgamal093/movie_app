import 'package:bloc/bloc.dart';
import 'package:movies_app/cubit/movie_details_cubit/movie_details_state.dart';
import 'package:movies_app/models/DeleteMovieResponse.dart';
import 'package:movies_app/models/IsMovieFavorite.dart';
import 'package:movies_app/models/MovieDetailsResponse.dart';
import 'package:movies_app/repository/movie_details_repo/movie_details_repo.dart';
import '../../models/AddMovieResponse.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsRepo movieDetailsRepo;
  AddMovieResponse? addMovieResponse;
  MovieDetailsResponse? movieDetailsResponse;
  IsMovieFavorite? isMovieFavorite;
  DeleteMovieResponse? deleteMovieResponse;
  MovieDetailsCubit(this.movieDetailsRepo) : super(MovieDetailsInitial());
  bool isFavorite = false;

  void changeFavorite() {
    isFavorite = !isFavorite;
    emit(ChangeFavoriteSuccess());
  }

  void getMovieDetails(String id) async {
    try {
      emit(MovieDetailsLoading());
      movieDetailsResponse = await movieDetailsRepo.getMovieDetails(id);
      emit(MovieDetailsSuccess());
    } catch (error) {
      emit(
        MovieDetailsError(message: error.toString()),
      );
    }
  }

  void addMovieToFavorites(String movieId, String name, String imageUrl,
      int rating, String year) async {
    try {
      emit(AddFavoriteMoviesLoading());
      changeFavorite();
      addMovieResponse = await movieDetailsRepo.addMovie(
          movieId, name, imageUrl, rating, year);
      movieFav(movieId);

      emit(AddFavoriteMoviesSuccess());
    } catch (error) {
      emit(
        AddFavoriteMoviesError(
          message: error.toString(),
        ),
      );
    }
  }

  void movieFav(String id) async {
    try {
      emit(IsMovieFavoriteLoading());
      isMovieFavorite = await movieDetailsRepo.isMovieFavorite(id.toString());
      isFavorite = isMovieFavorite!.data!;
      emit(IsMovieFavoriteSuccess());
    } catch (error) {
      emit(
        IsMovieFavoriteError(
          message: error.toString(),
        ),
      );
    }
  }

  void deleteMovie(String id) async {
    try {
      emit(DeleteMovieLoading());
      changeFavorite();
      deleteMovieResponse = await movieDetailsRepo.deleteMovie(
        id.toString(),
      );
      emit(DeleteMovieSuccess());
    } catch (error) {
      emit(
        DeleteMovieError(
          message: error.toString(),
        ),
      );
    }
  }
}

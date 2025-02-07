import 'package:bloc/bloc.dart';
import 'package:movies_app/cubit/movie_details_cubit/movie_details_state.dart';
import 'package:movies_app/models/MovieDetailsResponse.dart';
import 'package:movies_app/repository/movie_details_repo/movie_details_repo.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsRepo movieDetailsRepo;
  MovieDetailsResponse? movieDetailsResponse;
  MovieDetailsCubit(this.movieDetailsRepo) : super(MovieDetailsInitial());

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
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/models/MovieImages.dart';
import 'package:movies_app/repository/movie_images_repo/movie_images_repo.dart';

part 'movie_images_state.dart';

class MovieImagesCubit extends Cubit<MovieImagesState> {
  MovieImages? movieImages;
  MovieImagesRepo movieImagesRepo;
  MovieImagesCubit(this.movieImagesRepo) : super(MovieImagesInitial());

  void getMovieImages(String id) async {
    try {
      emit(MovieImagesLoading());
      movieImages = await movieImagesRepo.getMovieImages(id);
      emit(MovieImagesSuccess());
    } catch (error) {
      emit(MovieImagesError(message: error.toString()));
    }
  }
}

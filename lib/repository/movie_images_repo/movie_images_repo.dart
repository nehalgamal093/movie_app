import '../../models/movie_images.dart';

abstract class MovieImagesRepo {
  Future<MovieImages> getMovieImages(String id);
}
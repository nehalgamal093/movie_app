import '../../models/MovieImages.dart';

abstract class MovieImagesRepo {
  Future<MovieImages> getMovieImages(String id);
}
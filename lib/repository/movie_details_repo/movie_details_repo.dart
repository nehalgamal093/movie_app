import 'package:movies_app/models/MovieDetailsResponse.dart';

abstract class MovieDetailsRepo{
  Future<MovieDetailsResponse> getMovieDetails(String id);
}
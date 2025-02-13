import 'package:movies_app/models/movie_credits_response.dart';

abstract class MovieCreditsRepo{
  Future<MovieCreditsResponse> getCredits(String id);
}
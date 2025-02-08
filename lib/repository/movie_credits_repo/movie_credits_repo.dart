import 'package:movies_app/models/MovieCreditsResponse.dart';

abstract class MovieCreditsRepo{
  Future<MovieCreditsResponse> getCredits(String id);
}
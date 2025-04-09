class EndPoints{
  static const String popularMovies = '/3/movie/popular';
  static const String topRatedMovies = '/3/movie/top_rated';
  static const String genres = '/3/genre/movie/list';
  static const String moviesByGenre = '/3/discover/movie';
  static const String register = '/auth/register';
  static const String login ='/auth/login';
  static const String movieDetails ='/3/movie/';
  static  String movieImages(String id) =>'/3/movie/$id/images';
  static  String similarMovies(String id) =>'/3/movie/$id/similar';
  static  String movieCredits(String id) =>'/3/movie/$id/credits';
  static const String search = '/3/search/movie';
  static const String profile = '/profile';
  static const String favorites ='/favorites/all';
}
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/core/resources/endpoints.dart';
import 'package:movies_app/features/home/data/models/movies_model.dart';
import 'package:movies_app/features/movie_details/data/models/credit_model.dart';
import 'package:movies_app/features/movie_details/data/models/movie_images.dart';
import '../../../../../core/resources/constants_manager.dart';
import '../models/movie_model.dart';
import 'movie_details_remote_data_source.dart';

@Injectable(as: MovieDetailsRemoteDataSource)
class MovieDetailsRemoteDataSourceImpl implements MovieDetailsRemoteDataSource {
  APIManager apiManager;
  MovieDetailsRemoteDataSourceImpl(@Named('moviesAPIManager') this.apiManager);

  @override
  Future<MovieModel> getMovieDetails(String id) async {
    var result =
        await apiManager.getRequest('${EndPoints.movieDetails}/$id', params: {
      "api_key": AppConstants.apiKey,
    });
    MovieModel moviesModel = MovieModel.fromJson(result.data);
    return moviesModel;
  }

  @override
  Future<MovieImages> getMovieScreenShots(String id) async {
    var result =
        await apiManager.getRequest(EndPoints.movieImages(id), params: {
      "api_key": AppConstants.apiKey,
    });
    MovieImages images = MovieImages.fromJson(result.data);
    return images;
  }

  @override
  Future<MoviesModel> getSimilarMovies(String id) async {
    var result =
        await apiManager.getRequest(EndPoints.similarMovies(id), params: {
      "api_key": AppConstants.apiKey,
    });
    MoviesModel similarMovies = MoviesModel.fromJson(result.data);
    return similarMovies;
  }

  @override
  Future<CreditModel> getCredits(String id) async {
    var result =
        await apiManager.getRequest(EndPoints.movieCredits(id), params: {
      "api_key": AppConstants.apiKey,
    });
    CreditModel credits = CreditModel.fromJson(result.data);
    return credits;
  }
}

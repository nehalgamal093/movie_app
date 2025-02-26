import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/core/resources/constants_manager.dart';
import 'package:movies_app/core/resources/endpoints.dart';
import 'package:movies_app/features/home/data/datasource/remote_data_source/home_remote_datasource.dart';
import 'package:movies_app/features/home/data/models/movies_model.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  APIManager apiManager;

  HomeRemoteDataSourceImpl(this.apiManager);

  @override
  Future<MoviesModel> getPopularMovies() async {
    var response =
        await apiManager.getRequest(EndPoints.popularMovies, params: {
      "api_key": AppConstants.apiKey,
    });
    MoviesModel movieModel = MoviesModel.fromJson(response.data);
    return movieModel;
  }

  @override
  Future<MoviesModel> getTopRatedMovies() async {
    var response =
        await apiManager.getRequest(EndPoints.topRatedMovies, params: {
      "api_key": AppConstants.apiKey,
    });
    MoviesModel movieModel = MoviesModel.fromJson(response.data);
    return movieModel;
  }
}

import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/features/browse/data/datasource/remote_data_source/browse_remote_datasource.dart';
import 'package:movies_app/features/browse/data/models/genres_model.dart';
import 'package:movies_app/features/home/data/models/movies_model.dart';
import '../../../../../core/resources/constants_manager.dart';
import '../../../../../core/resources/endpoints.dart';

@Injectable(as: BrowseRemoteDataSource)
class BrowseRemoteDataSourceImpl implements BrowseRemoteDataSource {
  APIManager apiManager;
  BrowseRemoteDataSourceImpl(this.apiManager);

  @override
  Future<GenresModel> getGenres() async {
    var response = await apiManager.getRequest(EndPoints.genres, params: {
      "api_key": AppConstants.apiKey,
    });
    GenresModel genresModel = GenresModel.fromJson(response.data);
    return genresModel;
  }

  @override
  Future<MoviesModel> getMoviesByGenre(String id) async {
    var response = await apiManager.getRequest(EndPoints.moviesByGenre,
        params: {"api_key": AppConstants.apiKey, 'with_genres': id});
    MoviesModel moviesModel = MoviesModel.fromJson(response.data);
    return moviesModel;
  }
}

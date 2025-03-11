import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/features/home/data/models/movies_model.dart';
import 'package:movies_app/features/search_movie/data/datasource/remote_data_source/search_remote_data_source.dart';
import '../../../../../core/resources/constants_manager.dart';
import '../../../../../core/resources/endpoints.dart';


@Injectable(as: SearchRemoteDataSource)
class RemoteDataSourceImpl implements SearchRemoteDataSource{
  APIManager apiManager;
  RemoteDataSourceImpl(@Named('moviesAPIManager') this.apiManager);

  @override
  Future<MoviesModel> searchMovie(String keyword) async{
    var response =
        await apiManager.getRequest(EndPoints.search, params: {
      "api_key": AppConstants.apiKey,
       "query":keyword
    });
    MoviesModel movieModel = MoviesModel.fromJson(response.data);
    return movieModel;
  }

}
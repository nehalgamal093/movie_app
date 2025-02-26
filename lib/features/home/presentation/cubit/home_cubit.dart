import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/features/home/data/models/movies_model.dart';
import 'package:movies_app/features/home/domain/usecases/get_popular_movies_use_case.dart';
import 'package:movies_app/features/home/domain/usecases/get_top_rated_movies_use_case.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  GetPopularMoviesUseCase getPopularMoviesUseCase;
  GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  MoviesModel? moviesModel;
  HomeCubit(this.getPopularMoviesUseCase,this.getTopRatedMoviesUseCase) : super(HomeInitial());

  Future<void> getPopularMovies() async {
    emit(PopularMoviesLoading());
    var result = await getPopularMoviesUseCase();
    result.fold((l) {
      emit(
        PopularMoviesError(failures: l),
      );
    }, (r) {
      moviesModel = r;
      emit(
        PopularMoviesSuccess(popularMovies: r),
      );
    });
  }

  Future<void> getTopRatedMovies() async {
    emit(TopRatedMoviesLoading());
    var result = await getTopRatedMoviesUseCase();
    result.fold((l) {
      emit(
        TopRatedMoviesError(failures: l),
      );
    }, (r) {
      moviesModel = r;
      emit(
        TopRatedMoviesSuccess(topRatedMovies: r),
      );
    });
  }
}

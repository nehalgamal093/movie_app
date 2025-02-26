import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/features/browse/data/models/genres_model.dart';
import 'package:movies_app/features/browse/domain/usecases/get_genres_use_case.dart';
import 'package:movies_app/features/browse/domain/usecases/get_movies_by_genre_use_case.dart';
import 'package:movies_app/features/home/data/models/movies_model.dart';
part 'browse_state.dart';

@injectable
class BrowseCubit extends Cubit<BrowseState> {
  GetGenresUseCase genresUseCase;
  GenresModel? genresModel;
  MoviesModel? moviesModel;
  GetMoviesByGenreUseCase getMoviesByGenreUseCase;
  BrowseCubit(this.genresUseCase, this.getMoviesByGenreUseCase)
      : super(BrowseInitial());
  int index = 0;

  void changeIndex(int selectedIndex) async {
    index = selectedIndex;
    await getMoviesByGenre();
    emit(ChangeGenresSuccess());
  }

  Future<void> getGenres() async {
    emit(GenresLoadingState());
    var result = await genresUseCase();

    result.fold((l) {
      emit(
        GenresErrorState(failures: l),
      );
    }, (r) async{
      genresModel = r;
      await getMoviesByGenre();
      emit(
        GenresSuccessState(genres: r),
      );
    });
  }

  Future<void> getMoviesByGenre() async {
    emit(MoviesByGenresLoadingState());
    var result = await getMoviesByGenreUseCase(
        genresModel!.genres![index].id!.toString());
    result.fold((l) {
      emit(
        MoviesByGenresErrorState(failures: l),
      );
    }, (r) {
      moviesModel = r;
      emit(
        MoviesByGenresSuccessState(movies: r),
      );
    });
  }
}

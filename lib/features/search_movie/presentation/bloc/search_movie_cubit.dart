import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/features/home/data/models/movies_model.dart';
import 'package:movies_app/features/search_movie/domain/usecases/search_use_case.dart';
import '../../../../debounce/debounce.dart';
part 'search_movie_state.dart';

@injectable
class SearchMovieCubit extends Cubit<SearchMovieState> {
  SearchUseCase searchUseCase;
  MoviesModel? moviesModel;
  SearchMovieCubit(this.searchUseCase) : super(SearchMovieInitial());
  Debounce debounce = Debounce(delay: const Duration(milliseconds: 500));
  String keyword = "";
  void typeSearchKeyword(String keyword) {
    this.keyword = keyword;

    debounce.call(() {
      getSearchedMovies();
    });
  }

  Future<void> getSearchedMovies() async {
    emit(SearchMovieLoadingState());
    var result = await searchUseCase(keyword);
    result.fold((l) {
      emit(
        SearchMovieErrorState(failures: l),
      );
    }, (r) {
      moviesModel = r;
      emit(
        SearchMovieSuccessState(moviesModel: r),
      );
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:movies_app/models/movies_responses.dart';
import '../../debounce/debounce.dart';
import '../../repository/search_movie_repo/search_movie_repo.dart';
part 'movie_search_state.dart';

class MovieSearchCubit extends Cubit<MovieSearchState> {
  MoviesResponse? moviesResponse;
  SearchMovieRepo searchMovieRepo;
  MovieSearchCubit(this.searchMovieRepo) : super(MovieSearchInitial());
  Debounce debounce = Debounce(delay: const Duration(milliseconds: 500));
  String keyword ="";
  void typeSearchKeyword(String keyword){
    this.keyword = keyword;

      debounce.call((){
        getSearchedMovies();
      });

  }
  void getSearchedMovies() async {
    try {
      emit(MovieSearchLoading());
      moviesResponse = await searchMovieRepo.getSearchedMovies(keyword);
      emit(MovieSearchSuccess());
    } catch (error) {
      emit(MovieSearchError(message: error.toString()));
    }
  }
}

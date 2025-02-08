import 'package:bloc/bloc.dart';
import 'package:movies_app/models/MovieCreditsResponse.dart';
import 'package:movies_app/repository/movie_credits_repo/movie_credits_repo.dart';
part 'movie_credits_state.dart';

class MovieCreditsCubit extends Cubit<MovieCreditsState> {
  MovieCreditsResponse? movieCreditsResponse;
  MovieCreditsRepo movieCreditsRepo;
  MovieCreditsCubit(this.movieCreditsRepo) : super(MovieCreditsInitial());

  void getCredits(String id) async {
    try {
      emit(MovieCreditsLoading());
      movieCreditsResponse = await movieCreditsRepo.getCredits(id);
      emit(MovieCreditsSuccess());
    } catch (error) {
      emit(MovieCreditsError(message: error.toString()));
    }
  }
}

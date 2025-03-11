import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/features/home/data/models/movies_model.dart';
import 'package:movies_app/features/movie_details/data/models/credit_model.dart';
import 'package:movies_app/features/movie_details/data/models/movie_images.dart';
import 'package:movies_app/features/movie_details/data/models/movie_model.dart';
import 'package:movies_app/features/movie_details/domain/usecases/credits_usecase.dart';
import 'package:movies_app/features/movie_details/domain/usecases/movie_details_usecase.dart';
import 'package:movies_app/features/movie_details/domain/usecases/movie_images_usecase.dart';
import 'package:movies_app/features/movie_details/domain/usecases/similar_movies_usecase.dart';
part 'movie_details_state.dart';

@injectable
class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsUseCase movieDetailsUseCase;
  MovieImagesUseCase movieImagesUseCase;
  SimilarMoviesUseCase similarMoviesUseCase;
  CreditsUseCase creditsUseCase;
  MovieModel? model;
  MovieImages? images;
  MoviesModel? similarMovies;
  CreditModel? creditModel;
  MovieDetailsCubit(this.movieDetailsUseCase, this.movieImagesUseCase,
      this.creditsUseCase, this.similarMoviesUseCase)
      : super(MovieDetailsInitial());

  Future<void> getMovieDetails(String id) async {
    emit(MovieDetailsLoadingState());
    var result = await movieDetailsUseCase(id);
    result.fold((l) {
      emit(
        MovieDetailsErrorState(failures: l),
      );
    }, (r) {
      model = r;
      emit(
        MovieDetailsSuccessState(movieModel: r),
      );
    });
  }

  Future<void> getMovieImages(String id) async {
    emit(MovieImagesLoadingState());
    var result = await movieImagesUseCase(id);
    result.fold((l) {
      emit(
        MovieImagesErrorState(failures: l),
      );
    }, (r) {
      images = r;
      emit(
        MovieImagesSuccessState(images: r),
      );
    });
  }

  Future<void> getSimilarMovies(String id) async {
    emit(SimilarMoviesLoadingState());
    var result = await similarMoviesUseCase(id);
    result.fold((l) {
      emit(
        SimilarMoviesErrorState(failures: l),
      );
    }, (r) {
      similarMovies = r;
      emit(
        SimilarMoviesSuccessState(movies: r),
      );
    });
  }

  Future<void> getCredits(String id) async {
    emit(CreditsLoadingState());
    var result = await creditsUseCase(id);
    result.fold((l) {
      emit(
        CreditsErrorState(failures: l),
      );
    }, (r) {
      creditModel = r;
      emit(
        CreditsSuccessState(credits: r),
      );
    });
  }
}

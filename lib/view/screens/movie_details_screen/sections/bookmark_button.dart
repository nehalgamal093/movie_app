import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common_widgets/snack_bar_response.dart';
import 'package:movies_app/cubit/movie_details_cubit/movie_details_state.dart';
import 'package:movies_app/models/movie_details_response.dart';
import 'package:movies_app/repository/movie_details_repo/movie_details_impl.dart';
import 'package:movies_app/resources/string_manager.dart';
import 'package:movies_app/theme/color_manager.dart';
import '../../../../cubit/movie_details_cubit/movie_details_cubit.dart';
import '../../../../resources/assets_manager.dart';

class BookmarkButton extends StatelessWidget {
  final MovieDetailsResponse movieDetailsResponse;
  const BookmarkButton({super.key, required this.movieDetailsResponse});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailsCubit(MovieDetailsImpl())
        ..movieFav(movieDetailsResponse.id!.toString()),
      child: BlocConsumer<MovieDetailsCubit, MovieDetailsState>(
          builder: (context, state) {
        return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
            builder: (context, state) {
          if (state is IsMovieFavoriteLoading) {
            return Icon(
              Icons.bookmark_border,
              color: ColorManager.whiteColor,
              size: 40,
            );
          } else if (state is IsMovieFavoriteError) {
            return Text('Error');
          }
          var bloc = BlocProvider.of<MovieDetailsCubit>(context);
          if (!bloc.isFavorite) {
            return InkWell(
              onTap: () {
                bloc.addMovieToFavorites(
                    movieDetailsResponse.id.toString(),
                    movieDetailsResponse.originalTitle!,
                    movieDetailsResponse.posterPath!,
                    movieDetailsResponse.voteAverage!.toInt(),
                    movieDetailsResponse.releaseDate.toString());
              },
              child: Icon(
                Icons.bookmark_border,
                color: ColorManager.whiteColor,
                size: 40,
              ),
            );
          } else {
            return InkWell(
              onTap: () {
                bloc.deleteMovie(movieDetailsResponse.id.toString());
              },
              child: Image.asset(AssetsManager.bookmark),
            );
          }
        });
      }, listener: (context, state) {
        if (state is AddFavoriteMoviesSuccess) {
          snackBarResponse(context, StringsManager.movieAddedToFavorites);
        } else if (state is AddFavoriteMoviesError) {
          snackBarResponse(context, StringsManager.somethingWentWrong);

        }
      }),
    );
  }
}

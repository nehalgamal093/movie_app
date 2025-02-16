import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common_widgets/movie_item.dart';
import 'package:movies_app/cubit/movie_credits_cubit/movie_credits_cubit.dart';
import 'package:movies_app/cubit/movie_details_cubit/movie_details_cubit.dart';
import 'package:movies_app/cubit/movie_details_cubit/movie_details_state.dart';
import 'package:movies_app/cubit/similar_movies_cubit/similar_movies_cubit.dart';
import 'package:movies_app/repository/movie_credits_repo/movie_credits_impl.dart';
import 'package:movies_app/repository/movie_details_repo/movie_details_impl.dart';
import 'package:movies_app/repository/similar_movies_repo/similar_movies_impl.dart';
import 'package:movies_app/resources/string_manager.dart';
import 'package:movies_app/view/screens/movie_details_screen/sections/cast_section.dart';
import 'package:movies_app/view/screens/movie_details_screen/sections/genres_section.dart';
import 'package:movies_app/view/screens/movie_details_screen/sections/header.dart';
import 'package:movies_app/view/screens/movie_details_screen/sections/header_loading.dart';
import 'package:movies_app/view/screens/movie_details_screen/sections/icons_count_section.dart';
import 'package:movies_app/view/screens/movie_details_screen/sections/screenshots_section.dart';
import 'package:movies_app/view/screens/movie_details_screen/sections/similar_section.dart';
import 'package:movies_app/view/screens/movie_details_screen/sections/summary_section.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const String routeName = '/movie_details';

  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ArgumentsNavigation argumentsNavigation = ModalRoute.of(context)?.settings.arguments as ArgumentsNavigation;

    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                MovieDetailsCubit(MovieDetailsImpl())..getMovieDetails(argumentsNavigation.id),
          ),
          BlocProvider(
            create: (context) =>
                SimilarMoviesCubit(SimilarMoviesImpl())..getSimilarMovies(argumentsNavigation.id),
          ),
          BlocProvider(
            create: (context) =>
                MovieCreditsCubit(MovieCreditsImpl())..getCredits(argumentsNavigation.id),
          )
        ],
        child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
            builder: (context, state) {
          if (state is MovieDetailsLoading) {
            return HeaderLoading();
          } else if (state is MovieDetailsError) {
            Text('Error');
          }
          var bloc = BlocProvider.of<MovieDetailsCubit>(context);
          var movieDetails = bloc.movieDetailsResponse;
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Header(
                  onBack: argumentsNavigation.onBack,
                  movieDetailsResponse: movieDetails!,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
              IconsCountSection(movieDetails: movieDetails),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    StringsManager.screenShots.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontFamily: 'Roboto'),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 9,
                ),
              ),
              ScreenshotsSection(
                id: argumentsNavigation.id,
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    StringsManager.similar.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontFamily: 'Roboto'),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 9,
                ),
              ),
              SliverToBoxAdapter(child: SimilarSection()),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    StringsManager.summary.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontFamily: 'Roboto'),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 9,
                ),
              ),
              SummarySection(movieDetails: movieDetails),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    StringsManager.cast.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontFamily: 'Roboto'),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 9,
                ),
              ),
              CastSection(),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    StringsManager.genres.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontFamily: 'Roboto'),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 9,
                ),
              ),
              GenresSection(
                genres: movieDetails.genres!,
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 57,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubit/movie_details_cubit/movie_details_cubit.dart';
import 'package:movies_app/cubit/movie_details_cubit/movie_details_state.dart';
import 'package:movies_app/models/actor_model.dart';
import 'package:movies_app/repository/movie_details_repo/movie_details_impl.dart';
import 'package:movies_app/resources/assets_manager.dart';
import 'package:movies_app/resources/string_manager.dart';
import 'package:movies_app/view/screens/movie_details_screen/sections/cast_section.dart';
import 'package:movies_app/view/screens/movie_details_screen/sections/genres_section.dart';
import 'package:movies_app/view/screens/movie_details_screen/sections/header.dart';
import 'package:movies_app/view/screens/movie_details_screen/sections/icons_count_section.dart';
import 'package:movies_app/view/screens/movie_details_screen/sections/screenshots_section.dart';
import 'package:movies_app/view/screens/movie_details_screen/sections/similar_section.dart';
import 'package:movies_app/view/screens/movie_details_screen/sections/summary_section.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const String routeName = '/movie_details';

  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
        body: BlocProvider(
      create: (context) =>
          MovieDetailsCubit(MovieDetailsImpl())..getMovieDetails(id),
      child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
          builder: (context, state) {
        if (state is MovieDetailsLoading) {
          return CircularProgressIndicator();
        } else if (state is MovieDetailsError) {
          Text('Error');
        }
        var bloc = BlocProvider.of<MovieDetailsCubit>(context);
        var movieDetails = bloc.movieDetailsResponse;
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Header(movieDetailsResponse: movieDetails!,),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            IconsCountSection(movieDetails:movieDetails),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  StringsManager.screenShots,
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
            ScreenshotsSection(),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  StringsManager.similar,
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
            SimilarSection(),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  StringsManager.summary,
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
            SummarySection(movieDetails:movieDetails),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  StringsManager.cast,
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
                  StringsManager.genres,
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
            GenresSection(genres: movieDetails.genres!,),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 57,
              ),
            ),
          ],
        );
      }),
    ));
  }
}

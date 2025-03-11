import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common_widgets/movie_item.dart';
import 'package:movies_app/features/movie_details/presentation/bloc/movie_details_cubit.dart';
import 'package:movies_app/features/movie_details/presentation/screens/movie_details_screen/sections/cast_section.dart';
import 'package:movies_app/features/movie_details/presentation/screens/movie_details_screen/sections/genres_section.dart';
import 'package:movies_app/features/movie_details/presentation/screens/movie_details_screen/sections/header.dart';
import 'package:movies_app/features/movie_details/presentation/screens/movie_details_screen/sections/header_loading.dart';
import 'package:movies_app/features/movie_details/presentation/screens/movie_details_screen/sections/icons_count_section.dart';
import 'package:movies_app/features/movie_details/presentation/screens/movie_details_screen/sections/screenshots_section.dart';
import 'package:movies_app/features/movie_details/presentation/screens/movie_details_screen/sections/similar_section.dart';
import 'package:movies_app/features/movie_details/presentation/screens/movie_details_screen/sections/summary_section.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/resources/string_manager.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const String routeName = '/movie_details';

  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ArgumentsNavigation argumentsNavigation =
        ModalRoute.of(context)?.settings.arguments as ArgumentsNavigation;

    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<MovieDetailsCubit>()..getMovieDetails(argumentsNavigation.id),
        child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
            builder: (context, state) {
          if (state is MovieDetailsLoadingState) {
            return HeaderLoading();
          } else if (state is MovieDetailsErrorState) {
            Text('Error');
          }
          var bloc = BlocProvider.of<MovieDetailsCubit>(context);
          var movieDetails = bloc.model;
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Header(
                  onBack: argumentsNavigation.onBack,
                  movieModel: movieDetails!,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
              IconsCountSection(movieModel: movieDetails),
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
              SliverToBoxAdapter(child: SimilarSection(id: argumentsNavigation.id,)),
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
              SummarySection(movieModel: movieDetails),
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
              CastSection(id:argumentsNavigation.id),
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

import 'package:flutter/material.dart';
import 'package:movies_app/models/actor_model.dart';
import 'package:movies_app/resources/assets_manager.dart';
import 'package:movies_app/resources/string_manager.dart';
import 'package:movies_app/view/screens/movie_details_screen/sections/cast_section.dart';
import 'package:movies_app/view/screens/movie_details_screen/sections/genres_section.dart';
import 'package:movies_app/view/screens/movie_details_screen/sections/header.dart';
import 'package:movies_app/view/screens/movie_details_screen/sections/icons_count_section.dart';
import 'package:movies_app/view/screens/movie_details_screen/sections/screenshots_section.dart';
import 'package:movies_app/view/screens/movie_details_screen/sections/similar_section.dart';
import 'package:movies_app/view/screens/movie_details_screen/sections/summary_section.dart';
import 'package:movies_app/view/screens/movie_details_screen/widgets/cast_item.dart';
import 'package:movies_app/view/screens/movie_details_screen/widgets/genre_item.dart';
import 'package:movies_app/view/screens/movie_details_screen/widgets/icon_text.dart';

import '../../../common_widgets/movie_item.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const String routeName = '/movie_details';
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Header(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          IconsCountSection(),
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
          SummarySection(),
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
          GenresSection(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 57,
            ),
          ),
        ],
      ),
    );
  }
}

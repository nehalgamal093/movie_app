import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubit/movies_cubit/popular_movies_cubit.dart';
import 'package:movies_app/cubit/movies_cubit/popular_movies_state.dart';
import 'package:movies_app/repository/popular_movies/movies_impl.dart';
import 'package:movies_app/resources/assets_manager.dart';
import 'package:movies_app/view/screens/tabs/home_tab/sections/action_section.dart';
import 'package:movies_app/view/screens/tabs/home_tab/sections/home_loading.dart';
import 'package:movies_app/view/screens/tabs/home_tab/sections/slider_section.dart';
import 'package:movies_app/view/screens/tabs/home_tab/sections/watch_now_section.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedPhoto = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) =>
          PopularMoviesCubit(PopularMoviesImpl())..getPopularMovies(),
      child: BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
          builder: (context, state) {
        if (state is PopularMoviesLoading) {
          return HomeLoading();
        } else if (state is PopularMoviesError) {
          return Text('error');
        } else {
          var bloc = BlocProvider.of<PopularMoviesCubit>(context);
          var movies = bloc.moviesResponse!.results!;

          return Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'http://image.tmdb.org/t/p/w500${movies[selectedPhoto].posterPath!}'),
                  fit: BoxFit.fill,
                  opacity: .13),
            ),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Image.asset(AssetsManager.availableNow),
                ),
                SliverToBoxAdapter(
                  child: SliderSection(
                    popularMovies: movies,
                    onChanged: (index) {
                      setState(() {
                        selectedPhoto = index;
                      });
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: Image.asset(
                    AssetsManager.watchNow,
                    height: size.height * .15,
                  ),
                ),
                SliverToBoxAdapter(child: ActionSection()),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 12,
                  ),
                ),
                WatchNowSection(),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 80,
                  ),
                )
              ],
            ),
          );
        }
      }),
    );
  }
}

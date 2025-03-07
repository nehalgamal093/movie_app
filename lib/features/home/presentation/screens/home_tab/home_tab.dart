import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/di.dart';
import 'package:movies_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:movies_app/features/home/presentation/screens/home_tab/sections/action_section.dart';
import 'package:movies_app/features/home/presentation/screens/home_tab/sections/home_loading.dart';
import 'package:movies_app/features/home/presentation/screens/home_tab/sections/slider_section.dart';
import 'package:movies_app/features/home/presentation/screens/home_tab/sections/watch_now_section.dart';
import 'package:movies_app/resources/assets_manager.dart';

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
      create: (context) => getIt<HomeCubit>()..getPopularMovies(),
      child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        if (state is PopularMoviesLoading) {
          return HomeLoading();
        } else if (state is PopularMoviesError) {
          return Text('error');
        }

        var bloc = BlocProvider.of<HomeCubit>(context);
        var movies = bloc.moviesModel!.results;
        return Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'http://image.tmdb.org/t/p/w500${movies![selectedPhoto].posterPath!}'),
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
      }),
    );
  }
}

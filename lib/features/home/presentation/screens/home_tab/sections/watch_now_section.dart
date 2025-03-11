import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common_widgets/movie_item.dart';
import 'package:movies_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:movies_app/features/home/presentation/screens/home_tab/sections/section_loading.dart';

import '../../../../../../core/di/di.dart';



class WatchNowSection extends StatelessWidget {
  const WatchNowSection({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SliverPadding(
      padding: const EdgeInsets.only(left: 16),
      sliver: SliverToBoxAdapter(
        child: BlocProvider(
          create: (context) =>
              getIt<HomeCubit>()..getTopRatedMovies(),
          child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
            if (state is TopRatedMoviesLoading) {
              return SectionLoading();
            } else if (state is TopRatedMoviesError) {
              return Text('error');
            }
            var bloc = BlocProvider.of<HomeCubit>(context);
            var movies = bloc.moviesModel!.results;
            return SizedBox(
              height: size.height * .3,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies!.length,
                  separatorBuilder: (context, index) => SizedBox(
                        width: 16,
                      ),
                  itemBuilder: (context, index) {
                    return AspectRatio(
                      aspectRatio: 146 / 220,
                      child: MovieItem(
                        onBack: (){},
                        id:movies[index].id.toString(),
                        image:
                            'http://image.tmdb.org/t/p/w500${movies[index].posterPath}',
                        rating: movies[index]
                            .voteAverage
                            .toString()
                            .substring(0, 3),
                      ),
                    );
                  }),
            );
          }),
        ),
      ),
    );
  }
}


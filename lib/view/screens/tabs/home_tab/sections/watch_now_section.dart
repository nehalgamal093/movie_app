import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubit/top_rated_cubit/top_rated_cubit.dart';
import 'package:movies_app/cubit/top_rated_cubit/top_rated_state.dart';
import 'package:movies_app/repository/popular_movies/movies_impl.dart';
import 'package:movies_app/view/screens/tabs/home_tab/sections/section_loading.dart';
import '../../../../../common_widgets/movie_item.dart';

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
              TopRatedCubit(PopularMoviesImpl())..getTopRated(),
          child: BlocBuilder<TopRatedCubit, TopRatedState>(
              builder: (context, state) {
            if (state is TopRatedLoading) {
              return SectionLoading();
            } else if (state is TopRatedError) {
              return Text('error');
            }
            var bloc = BlocProvider.of<TopRatedCubit>(context);
            var movies = bloc.moviesResponse!.results!;
            return SizedBox(
              height: size.height * .3,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
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


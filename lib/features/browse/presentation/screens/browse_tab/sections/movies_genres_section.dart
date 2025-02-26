import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common_widgets/loading_movies.dart';
import 'package:movies_app/common_widgets/movie_item.dart';
import 'package:movies_app/features/browse/presentation/cubit/browse_cubit.dart';


class MoviesGenresSection extends StatelessWidget {
  const MoviesGenresSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrowseCubit, BrowseState>(
        builder: (context, state) {
      if (state is MoviesByGenresLoadingState) {
        return Expanded(child: LoadingMovies());
      } else if (state is MoviesByGenresErrorState) {
        return Text('Error');
      }
      var bloc = BlocProvider.of<BrowseCubit>(context);
      var movies = bloc.moviesModel!.results;
      return Expanded(
        child: GridView.builder(
            itemCount: movies!.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 191 / 279),
            itemBuilder: (context, index) {
              return MovieItem(
                onBack: (){},
                id: movies[index].id.toString(),
                image:  'http://image.tmdb.org/t/p/w500${movies[index].posterPath!}',
                rating: movies[index].voteAverage.toString(),
              );
            }),
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common_widgets/loading_movies.dart';
import 'package:movies_app/cubit/genres_movies_cubit/genres_movies_cubit.dart';
import 'package:movies_app/cubit/genres_movies_cubit/genres_movies_state.dart';
import '../../../../../common_widgets/movie_item.dart';

class MoviesGenresSection extends StatelessWidget {
  const MoviesGenresSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenresMoviesCubit, GenresMoviesState>(
        builder: (context, state) {
      if (state is MoviesLoading) {
        return Expanded(child: LoadingMovies());
      } else if (state is MoviesError) {
        return Text('Error');
      }
      var bloc = BlocProvider.of<GenresMoviesCubit>(context);
      var movies = bloc.moviesResponse!.results;
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

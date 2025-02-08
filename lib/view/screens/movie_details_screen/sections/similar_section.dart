import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubit/similar_movies_cubit/similar_movies_cubit.dart';
import '../../../../common_widgets/movie_item.dart';

class SimilarSection extends StatelessWidget {
  const SimilarSection({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<SimilarMoviesCubit, SimilarMoviesState>(
        builder: (context, state) {
      if (state is SimilarMoviesLoading) {
        return CircularProgressIndicator();
      } else if (state is SimilarMoviesError) {
        return Text('Error');
      }
      var bloc = BlocProvider.of<SimilarMoviesCubit>(context);
      var movies = bloc.moviesResponse?.results??[];
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: List.generate(
            movies.isNotEmpty?4:0,
            (index) => movies.isNotEmpty?Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              height: size.height * .3,
              width: size.width*.4,
              child: MovieItem(
                //TODO: if image is null
                id: movies[index+1].id.toString(),
                image:
                'http://image.tmdb.org/t/p/w500${movies[index+1].posterPath!}',
                rating: movies[index+1].voteAverage.toString(),
              ),
            ):SizedBox()
          ),
        ),
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/movie_details/presentation/bloc/movie_details_cubit.dart';
import '../../../../../../common_widgets/movie_item.dart';
import '../../../../../../core/di/di.dart';


class SimilarSection extends StatelessWidget {
  final String id;
  const SimilarSection({super.key,required this.id});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => getIt<MovieDetailsCubit>()..getSimilarMovies(id),
      child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
          builder: (context, state) {
        if (state is SimilarMoviesLoadingState) {
          return CircularProgressIndicator();
        } else if (state is SimilarMoviesErrorState) {
          return Text('Error');
        }
        var bloc = BlocProvider.of<MovieDetailsCubit>(context);
        var movies = bloc.similarMovies?.results??[];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Wrap(
            alignment: WrapAlignment.center,
            children: List.generate(
              movies.isNotEmpty?4:0,
              (index) {
                if(movies[index].posterPath==null){
                  index++;
                }
               return
                 movies.isNotEmpty?Container(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  height: size.height * .3,
                  width: size.width*.4,
                  child: MovieItem(
                    onBack: (){},
                    id: movies[index].id.toString(),
                    image:
                    'http://image.tmdb.org/t/p/w500${movies[index].posterPath!}',
                    rating: movies[index].voteAverage.toString(),
                  ),
                ):
               SizedBox();

              }
            ),
          ),
        );
      }),
    );
  }
}

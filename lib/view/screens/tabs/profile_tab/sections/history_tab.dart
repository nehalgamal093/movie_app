import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common_widgets/loading_movies.dart';
import 'package:movies_app/common_widgets/movie_item.dart';
import 'package:movies_app/cubit/favorite_movies_cubit/favorite_movies_cubit.dart';
import 'package:movies_app/repository/fav_movies_repo/fav_movie_repo_impl.dart';
import '../../../../../resources/assets_manager.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});
  final List<String> moviePosters = const [
    AssetsManager.moviePoster1,
    AssetsManager.moviePoster2,
    AssetsManager.moviePoster3,
    AssetsManager.moviePoster4,
    AssetsManager.moviePoster5,
    AssetsManager.moviePoster6,
    AssetsManager.moviePoster7,
    AssetsManager.moviePoster8,
    AssetsManager.moviePoster9,
    AssetsManager.moviePoster10,
    AssetsManager.moviePoster11,
    AssetsManager.moviePoster12,
    AssetsManager.moviePoster1,
    AssetsManager.moviePoster2,
    AssetsManager.moviePoster3,
    AssetsManager.moviePoster4,
    AssetsManager.moviePoster5,
    AssetsManager.moviePoster6,
    AssetsManager.moviePoster7,
    AssetsManager.moviePoster8,
    AssetsManager.moviePoster9,
    AssetsManager.moviePoster10,
    AssetsManager.moviePoster11,
    AssetsManager.moviePoster12,
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>FavoriteMoviesCubit(FavoriteMovieRepoImpl())..getFavoriteMovies(),
      child: BlocBuilder<FavoriteMoviesCubit,FavoriteMoviesState>(
    
        builder: (context,state) {
          if(state is FavoriteMoviesLoading){
            return LoadingMovies();
          } else if(state is FavoriteMoviesError){
            return Text(state.message.toString());
          }
          var bloc = BlocProvider.of<FavoriteMoviesCubit>(context);
          var movies = bloc.favoriteMovies!.data!;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
                itemCount: movies.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 122 / 179),
                itemBuilder: (context, index) {
                  return MovieItem(
                    id:movies[index].movieId!,
                    image:'http://image.tmdb.org/t/p/w500${movies[index].imageURL!}',
                    rating:movies[index].rating.toString(),
                  );
                }),
          );
        }
      ),
    );
  }
}

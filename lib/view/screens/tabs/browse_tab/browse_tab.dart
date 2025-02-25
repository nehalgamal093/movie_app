import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common_widgets/loading_movies.dart';
import 'package:movies_app/cubit/genres_movies_cubit/genres_movies_cubit.dart';
import 'package:movies_app/cubit/genres_movies_cubit/genres_movies_state.dart';
import 'package:movies_app/repository/movies_genres_repo/movie_genres_impl.dart';
import 'package:movies_app/view/screens/tabs/browse_tab/sections/categoried_tab_sections.dart';
import 'package:movies_app/view/screens/tabs/browse_tab/sections/movies_genres_section.dart';
import '../../../../resources/assets_manager.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenresMoviesCubit(MovieGenresImpl())..getGenres(),
      child: BlocBuilder<GenresMoviesCubit, GenresMoviesState>(
          builder: (context, state) {
        if (state is GenresMoviesLoading) {
          return LoadingMovies();
        } else if (state is GenresMoviesError) {
          return Text('Error');
        }
        var bloc = BlocProvider.of<GenresMoviesCubit>(context);
        var genres = bloc.genresResponse!.genres;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: SizedBox(
                  height: 40,
                  child: CategoriesTabSections(
                    index: bloc.index,
                    genres: genres!,
                    genresMoviesCubit: bloc,
                  ),
                ),
              ),
              MoviesGenresSection(),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        );
      }),
    );
  }
}


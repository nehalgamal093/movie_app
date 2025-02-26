import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common_widgets/loading_movies.dart';
import 'package:movies_app/di.dart';
import 'package:movies_app/features/browse/presentation/cubit/browse_cubit.dart';
import 'package:movies_app/features/browse/presentation/screens/browse_tab/sections/categoried_tab_sections.dart';
import 'package:movies_app/features/browse/presentation/screens/browse_tab/sections/movies_genres_section.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BrowseCubit>()..getGenres(),
      child: BlocBuilder<BrowseCubit, BrowseState>(builder: (context, state) {
        if (state is GenresLoadingState) {
          return LoadingMovies();
        } else if (state is GenresErrorState) {
          return Text('Error');
        }
        var bloc = BlocProvider.of<BrowseCubit>(context);
        var genres = bloc.genresModel!.genres;
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
                    browseCubit: bloc,
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

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common_widgets/custom_textfield.dart';
import 'package:movies_app/common_widgets/loading_movies.dart';
import 'package:movies_app/common_widgets/movie_item.dart';
import 'package:movies_app/features/search_movie/presentation/bloc/search_movie_cubit.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/resources/string_manager.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocProvider(
        create: (context) =>getIt<SearchMovieCubit>()..getSearchedMovies(),
        child: BlocBuilder<SearchMovieCubit, SearchMovieState>(
            builder: (context, state) {
          var bloc = BlocProvider.of<SearchMovieCubit>(context);
          return Column(
            children: [
              SizedBox(
                height: 30,
              ),
              CustomTextField(
                  onChanged: (val) {
                    bloc.typeSearchKeyword(val);
                  },
                  hintText: StringsManager.search.tr(),
                  prefixIcon: AssetsManager.search),
              BlocBuilder<SearchMovieCubit, SearchMovieState>(
                  builder: (context, state) {
                if (state is SearchMovieLoadingState) {
                  return Expanded(child: LoadingMovies());
                } else if (state is SearchMovieErrorState) {
                  return Text('Error');
                }
                var bloc = BlocProvider.of<SearchMovieCubit>(context);
                var searchedMovies = bloc.moviesModel!.results ?? [];
                return Expanded(
                  child: GridView.builder(
                      itemCount: searchedMovies.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 191 / 279),
                      itemBuilder: (context, index) {
                        return MovieItem(
                          onBack: () {},
                          id: searchedMovies[index].id.toString(),
                          image:
                              'http://image.tmdb.org/t/p/w500${searchedMovies[index].posterPath}',
                          rating: searchedMovies[index]
                              .voteAverage
                              .toString()
                              .substring(0, 3),
                        );
                      }),
                );
              }),
            ],
          );
        }),
      ),
    );
  }
}

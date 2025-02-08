import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubit/movie_images_cubit/movie_images_cubit.dart';
import 'package:movies_app/repository/movie_images_repo/movie_images_impl.dart';
import '../../../../resources/assets_manager.dart';

class ScreenshotsSection extends StatelessWidget {
  final String id;
  const ScreenshotsSection({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: BlocProvider(
        create: (context) =>
            MovieImagesCubit(MovieImagesImpl())..getMovieImages(id),
        child: BlocBuilder<MovieImagesCubit, MovieImagesState>(
            builder: (context, state) {
          if (state is MovieImagesLoading) {
            return CircularProgressIndicator();
          } else if (state is MovieImagesError) {
            return Text('Error');
          }
          var bloc = BlocProvider.of<MovieImagesCubit>(context);
          var images = bloc.movieImages!.posters;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: List.generate(
                3,
                (index) => Container(
                  width: double.infinity,
                  height:size.height*.19 ,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      'http://image.tmdb.org/t/p/w500${images![index].filePath!}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

List<String> assets = [
  AssetsManager.header1,
  AssetsManager.header2,
  AssetsManager.header3,
];

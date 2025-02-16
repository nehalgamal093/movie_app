import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubit/movie_images_cubit/movie_images_cubit.dart';
import 'package:movies_app/repository/movie_images_repo/movie_images_impl.dart';
import 'package:movies_app/view/screens/movie_details_screen/sections/screenshots_loading.dart';

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
            return ScreenshotsLoading();
          } else if (state is MovieImagesError) {
            return Text('Error');
          }
          var bloc = BlocProvider.of<MovieImagesCubit>(context);
          var images = bloc.movieImages!.posters??[];
          int length = 0;
          if(images.isNotEmpty&&images.length>3){
            length = 3;
          } else {
            length = images.length;
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: List.generate(
                images.isNotEmpty?length:0,
                (index) =>images.isNotEmpty? Container(
                  width: double.infinity,
                  height:size.height*.19 ,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      'http://image.tmdb.org/t/p/w500${images[index].filePath!}',
                      height: size.height*.3,
                      fit: BoxFit.cover,
                    ),
                  ),
                ):SizedBox(),
              ),
            ),
          );
        }),
      ),
    );
  }
}



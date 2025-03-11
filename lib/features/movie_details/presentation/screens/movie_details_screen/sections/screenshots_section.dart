import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/movie_details/presentation/bloc/movie_details_cubit.dart';
import 'package:movies_app/features/movie_details/presentation/screens/movie_details_screen/sections/screenshots_loading.dart';

import '../../../../../../core/di/di.dart';

class ScreenshotsSection extends StatelessWidget {
  final String id;
  const ScreenshotsSection({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: BlocProvider(
        create: (context) =>
            getIt<MovieDetailsCubit>()..getMovieImages(id),
        child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
            builder: (context, state) {
          if (state is MovieImagesLoadingState) {
            return ScreenshotsLoading();
          } else if (state is MovieImagesErrorState) {
            return Text('Error');
          }
          var bloc = BlocProvider.of<MovieDetailsCubit>(context);
          var images = bloc.images!.posters??[];
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



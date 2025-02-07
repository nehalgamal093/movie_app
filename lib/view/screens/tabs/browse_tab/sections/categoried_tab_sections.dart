import 'package:flutter/material.dart';
import 'package:movies_app/cubit/genres_movies_cubit/genres_movies_cubit.dart';
import 'package:movies_app/models/GenresResponse.dart';
import '../../../../../theme/color_manager.dart';

class CategoriesTabSections extends StatelessWidget {
  final List<Genres> genres;
    final int index;
    final GenresMoviesCubit genresMoviesCubit;
  const CategoriesTabSections({super.key,required this.index,required this.genres,required this.genresMoviesCubit});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: genres.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(
              width: 7,
            ),
        itemBuilder: (context, i) {
          return InkWell(
            onTap: (){
              genresMoviesCubit.changeIndex(i);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: index == i
                      ? ColorManager.primaryColor
                      : ColorManager.blackColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: ColorManager.primaryColor)),
              child: Center(
                child: Text(
                 genres[i].name!,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: index == i
                          ? ColorManager.blackColor
                          : ColorManager.primaryColor),
                ),
              ),
            ),
          );
        });
  }
}

// List<String> categories = ['Action', 'Adventure', 'Animation', 'Biography'];

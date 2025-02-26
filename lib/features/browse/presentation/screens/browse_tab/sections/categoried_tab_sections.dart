import 'package:flutter/material.dart';
import 'package:movies_app/features/browse/data/models/genres_model.dart';
import 'package:movies_app/features/browse/presentation/cubit/browse_cubit.dart';
import 'package:movies_app/theme/color_manager.dart';

class CategoriesTabSections extends StatelessWidget {
  final List<Genres> genres;
  final int index;
  final BrowseCubit browseCubit;
  const CategoriesTabSections(
      {super.key,
      required this.index,
      required this.genres,
      required this.browseCubit});

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
            onTap: () {
              browseCubit.changeIndex(i);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: index == i
                    ? ColorManager.primaryColor
                    : ColorManager.blackColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: ColorManager.primaryColor),
              ),
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

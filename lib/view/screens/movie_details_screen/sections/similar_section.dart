import 'package:flutter/material.dart';
import '../../../../common_widgets/movie_item.dart';
import '../../../../resources/assets_manager.dart';

class SimilarSection extends StatelessWidget {
  const SimilarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverGrid.builder(
          itemCount: list.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 191 / 279),
          itemBuilder: (context, index) {
            return MovieItem(
              id:'9484',
              image: list[index],
              rating: '7.7',
            );
          }),
    );
  }
}
List<String> list = [
  AssetsManager.moviePoster1,
  AssetsManager.moviePoster2,
  AssetsManager.moviePoster3,
  AssetsManager.moviePoster4,

];
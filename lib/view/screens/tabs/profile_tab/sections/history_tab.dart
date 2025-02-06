import 'package:flutter/material.dart';
import 'package:movies_app/common_widgets/movie_item.dart';
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
    return GridView.builder(
        itemCount: moviePosters.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 122 / 179),
        itemBuilder: (context, index) {
          return MovieItem(
            image: moviePosters[index],
            rating: '7.7',
          );
        });
  }
}

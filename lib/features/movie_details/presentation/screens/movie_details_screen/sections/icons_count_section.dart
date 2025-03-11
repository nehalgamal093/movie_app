import 'package:flutter/material.dart';
import 'package:movies_app/features/movie_details/data/models/movie_model.dart';
import '../../../../../../core/resources/assets_manager.dart';
import '../widgets/icon_text.dart';

class IconsCountSection extends StatelessWidget {
  final MovieModel movieModel;
  const IconsCountSection({super.key, required this.movieModel});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconText(
            image: AssetsManager.heart,
            count: movieModel.voteCount.toString(),
          ),
          SizedBox(
            width: 16,
          ),
          IconText(
            image: AssetsManager.watch,
            count: movieModel.runtime.toString(),
          ),
          SizedBox(
            width: 16,
          ),
          IconText(
            image: AssetsManager.star2,
            count: movieModel.voteAverage.toString().substring(0, 3),
          ),
        ],
      ),
    );
  }
}

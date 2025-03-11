import 'package:flutter/material.dart';
import 'package:movies_app/features/movie_details/data/models/movie_model.dart';

class SummarySection extends StatelessWidget {
  final MovieModel movieModel;
  const SummarySection({super.key, required this.movieModel});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverToBoxAdapter(
        child: Text(
          movieModel.overview!,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}

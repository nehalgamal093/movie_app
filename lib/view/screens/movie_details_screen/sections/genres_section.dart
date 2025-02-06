import 'package:flutter/material.dart';

import '../widgets/genre_item.dart';

class GenresSection extends StatelessWidget {
  const GenresSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Wrap(
            spacing: 10,
            runSpacing: 5,
            children: List.generate(
                genres.length,
                (index) => GenreItem(
                      title: genres[index],
                    ))),
      ),
    );
  }
}

List<String> genres = ['Action', 'Sci-Fi', 'Adventure', 'Horror', 'Fantasy'];

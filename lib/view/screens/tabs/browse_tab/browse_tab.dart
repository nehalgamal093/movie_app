import 'package:flutter/material.dart';
import 'package:movies_app/view/screens/tabs/browse_tab/sections/categoried_tab_sections.dart';

import '../../../../common_widgets/movie_item.dart';
import '../../../../resources/assets_manager.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SizedBox(
              height: 40,
              child: CategoriesTabSections(),
            ),
          ),
          Expanded(
              child: GridView.builder(
                  itemCount: list.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 191 / 279),
                  itemBuilder: (context, index) {
                    return MovieItem(
                      image: list[index],
                      rating: '7.7',
                    );
                  }))
        ],
      ),
    );
  }
}

List<String> list = [
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
  AssetsManager.moviePoster13,
];
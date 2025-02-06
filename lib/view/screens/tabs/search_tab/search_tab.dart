import 'package:flutter/material.dart';
import 'package:movies_app/common_widgets/custom_textfield.dart';
import 'package:movies_app/common_widgets/movie_item.dart';
import 'package:movies_app/resources/assets_manager.dart';
import 'package:movies_app/resources/string_manager.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          CustomTextField(
              hintText: StringsManager.search,
              prefixIcon: AssetsManager.search),
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

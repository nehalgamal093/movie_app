import 'package:flutter/material.dart';
import 'package:movies_app/common_widgets/movie_item.dart';
import 'package:movies_app/resources/assets_manager.dart';
import 'package:movies_app/view/screens/tabs/home_tab/sections/action_section.dart';
import 'package:movies_app/view/screens/tabs/home_tab/sections/slider_section.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedPhoto = 0;
//TODO:Use provider
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(list[selectedPhoto]),
            fit: BoxFit.fill,
            opacity: .13),
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Image.asset(AssetsManager.availableNow),
          ),
          SliverToBoxAdapter(
            child: SliderSection(
              onChanged: (index) {
                setState(() {
                  selectedPhoto = index;
                });
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Image.asset(
              AssetsManager.watchNow,
              height: size.height * .15,
            ),
          ),
          SliverToBoxAdapter(child: ActionSection()),
          SliverPadding(
            padding: const EdgeInsets.only(left: 16),
            sliver: SliverToBoxAdapter(
                child: SizedBox(
              height: size.height * .3,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: list2.length,
                  separatorBuilder: (context, index) => SizedBox(
                        width: 16,
                      ),
                  itemBuilder: (context, index) {
                    return AspectRatio(
                      aspectRatio: 146 / 220,
                      child: MovieItem(image: list2[index], rating: '7.7'),
                    );
                  }),
            )),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 80,
            ),
          )
        ],
      ),
    );
  }
}

List<String> list2 = [
  AssetsManager.moviePoster5,
  AssetsManager.moviePoster6,
  AssetsManager.moviePoster7,
  AssetsManager.moviePoster8,
];
List<String> list = [
  AssetsManager.moviePoster1,
  AssetsManager.moviePoster12,
  AssetsManager.moviePoster13,
  AssetsManager.moviePoster10,
];

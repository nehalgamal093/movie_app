import 'package:flutter/material.dart';
import 'package:movies_app/resources/assets_manager.dart';
import 'package:movies_app/theme/color_manager.dart';
import 'package:movies_app/view/screens/movie_details_screen/movie_details_screen.dart';

class MovieItem extends StatelessWidget {
  final String image;
  final String rating;
  final String id;
  const MovieItem({super.key, required this.image, required this.rating,required this.id});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context,MovieDetailsScreen.routeName,arguments: id);
      },
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(image,fit: BoxFit.cover,),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
                color: ColorManager.blackColorWithOpacity,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  rating,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Image.asset(AssetsManager.star),
              ],
            ),
          )
        ],
      ),
    );
  }
}

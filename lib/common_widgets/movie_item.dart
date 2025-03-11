import 'package:flutter/material.dart';
import 'package:movies_app/features/movie_details/presentation/screens/movie_details_screen/movie_details_screen.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/theme/color_manager.dart';

class MovieItem extends StatelessWidget {
  final String image;
  final String rating;
  final String id;
  final Function onBack;
  const MovieItem({super.key, required this.image, required this.rating,required this.id, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        ArgumentsNavigation argumentsNavigation = ArgumentsNavigation(id: id, onBack: (){
          onBack();
        });
        Navigator.pushNamed(context,MovieDetailsScreen.routeName,arguments: argumentsNavigation,);
      },
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: image.substring(30)=="null" ?Image.asset(AssetsManager.noImage,fit: BoxFit.cover,):Image.network('http://image.tmdb.org/t/p/w500$image',fit: BoxFit.cover,),
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
                SizedBox(width: 4,),
                Image.asset(AssetsManager.star),
              ],
            ),
          )
        ],
      ),
    );
  }
}
class ArgumentsNavigation{
  String id;
  Function onBack;
  ArgumentsNavigation({required this.id,required this.onBack});
}
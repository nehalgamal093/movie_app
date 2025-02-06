import 'package:flutter/material.dart';
import 'package:movies_app/theme/color_manager.dart';

class IconText extends StatelessWidget {
  final String image;
  final String count;
  const IconText({super.key,required this.image,required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color:ColorManager.darkGreyColor
      ),
      child: Row(

        children: [
          Image.asset(image),
          SizedBox(width:18,),
          Text(count,style: Theme.of(context).textTheme.bodyMedium,)
        ],
      ),
    );
  }
}

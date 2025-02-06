import 'package:flutter/material.dart';
import 'package:movies_app/theme/color_manager.dart';

class GenreItem extends StatelessWidget {
  final String title;
  const GenreItem({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      decoration: BoxDecoration(
        color: ColorManager.darkGreyColor,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Text(title),
    );
  }
}

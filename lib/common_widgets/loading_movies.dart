import 'package:flutter/material.dart';
import 'package:movies_app/theme/color_manager.dart';

class LoadingMovies extends StatelessWidget {
  const LoadingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GridView.builder(
          itemCount: 20,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 191 / 279,crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorManager.darkGreyColor),
              );
            }),
      ),
    );
  }
}

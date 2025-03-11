import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/assets_manager.dart';

class WatchListTab extends StatelessWidget {
  const WatchListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 70,),
        Image.asset(AssetsManager.popCorn)
      ],
    );
  }
}

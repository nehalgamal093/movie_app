import 'package:flutter/material.dart';

import '../../../../resources/assets_manager.dart';
import '../widgets/icon_text.dart';

class IconsCountSection extends StatelessWidget {
  const IconsCountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconText(image: AssetsManager.heart, count: '15'),
          SizedBox(
            width: 16,
          ),
          IconText(image: AssetsManager.watch, count: '90'),
          SizedBox(
            width: 16,
          ),
          IconText(image: AssetsManager.star2, count: '7.6'),
        ],
      ),
    );
  }
}

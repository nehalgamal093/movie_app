import 'package:flutter/material.dart';
import '../../../../resources/assets_manager.dart';

class ScreenshotsSection extends StatelessWidget {
  const ScreenshotsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: assets.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              assets[index],
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(height: 16),
    );
  }
}
List<String> assets = [
  AssetsManager.header1,
  AssetsManager.header2,
  AssetsManager.header3,
];
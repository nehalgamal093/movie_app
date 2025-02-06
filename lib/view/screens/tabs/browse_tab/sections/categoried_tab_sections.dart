import 'package:flutter/material.dart';
import '../../../../../theme/color_manager.dart';

class CategoriesTabSections extends StatelessWidget {
  const CategoriesTabSections({super.key});
  final int selected = 0;
//TODO:Provider
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(
              width: 7,
            ),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: selected == index
                    ? ColorManager.primaryColor
                    : ColorManager.blackColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: ColorManager.primaryColor)),
            child: Center(
              child: Text(
                categories[index],
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: selected == index
                        ? ColorManager.blackColor
                        : ColorManager.primaryColor),
              ),
            ),
          );
        });
  }
}

List<String> categories = ['Action', 'Adventure', 'Animation', 'Biography'];

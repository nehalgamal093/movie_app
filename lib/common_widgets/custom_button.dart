import 'package:flutter/material.dart';
import '../theme/color_manager.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color color;
  final Color textColor;
  final Color borderColor;
  final Function() onPressed;
  const CustomButton(
      {super.key,
      required this.color,
      required this.title,
      required this.onPressed,
        this.textColor = ColorManager.blackColor,
      this.borderColor = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              padding: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: borderColor),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: textColor, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }
}

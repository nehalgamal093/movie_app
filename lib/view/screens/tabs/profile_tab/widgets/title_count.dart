import 'package:flutter/material.dart';

class TitleCount extends StatelessWidget {
  final String title;
  final String count;
  const TitleCount({super.key,required this.title,required this.count});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(count),
        SizedBox(height: 20,),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontFamily: 'Roboto'),
        ),
      ],
    );
  }
}

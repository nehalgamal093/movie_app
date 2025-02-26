import 'package:flutter/material.dart';
import 'package:movies_app/features/home/presentation/screens/home_tab/sections/section_loading.dart';

class HomeLoading extends StatelessWidget {
  const HomeLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100,),
          Expanded(child: SectionLoading()),
          SizedBox(height: 150,),
          Expanded(child: SectionLoading()),
          SizedBox(height: 100,),
        ],
      ),
    );
  }
}

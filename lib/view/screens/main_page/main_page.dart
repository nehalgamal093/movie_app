import 'package:flutter/material.dart';
import 'package:movies_app/theme/color_manager.dart';
import '../../../resources/assets_manager.dart';
import '../tabs/profile_tab/profile_tab.dart';

class MainPage extends StatefulWidget {
  static const routeName = '/main_page';
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

int selectedIndex = 0;

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: ColorManager.darkGreyColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            icons.length,
            (i) => InkWell(
                onTap: () {
                  //TODO:USE PROVIDER
                  setState(() {
                    selectedIndex = i;
                  });
                },
                child: ImageIcon(
                  AssetImage(icons[i]),
                color:selectedIndex==i?ColorManager.primaryColor: Colors.white,
                )),
          ),
        ),
      ),
    );
  }

  final List<String> icons = const [
    AssetsManager.home,
    AssetsManager.search,
    AssetsManager.browse,
    AssetsManager.profile
  ];

  final List<Widget> list = const [
    Center(
      child: Text('Home'),
    ),
    Center(
      child: Text('Search'),
    ),
    Center(
      child: Text('Browse'),
    ),
    ProfileTab()
  ];
}


import 'package:flutter/material.dart';
import 'package:movies_app/theme/my_theme/base_theme.dart';
import 'package:movies_app/theme/my_theme/main_theme.dart';
import 'package:movies_app/view/screens/explore/explore_screen.dart';
import 'package:movies_app/view/screens/login_screen/login_screen.dart';
import 'package:movies_app/view/screens/onboarding_screen/onboarding_screen.dart';
import 'package:movies_app/view/screens/register_screen/register_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    BaseTheme mainTheme = MainTheme();
    return MaterialApp(
      title: 'Movie app',
      debugShowCheckedModeBanner: false,
      theme: mainTheme.myThemeData,
      initialRoute: ExploreScreen.routeName,
      routes: {
        ExploreScreen.routeName: (context) => ExploreScreen(),
        OnboardingScreen.routeName: (context) => OnboardingScreen(),
        LoginScreen.routeName:(context) => LoginScreen(),
        RegisterScreen.routeName :(context)=>RegisterScreen()
      },
    );
  }
}

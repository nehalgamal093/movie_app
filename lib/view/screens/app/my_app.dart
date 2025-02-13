import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/caching/cache_helper.dart';
import 'package:movies_app/theme/my_theme/base_theme.dart';
import 'package:movies_app/theme/my_theme/main_theme.dart';
import 'package:movies_app/view/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:movies_app/view/screens/explore/explore_screen.dart';
import 'package:movies_app/view/screens/forget_password_screen.dart';
import 'package:movies_app/view/screens/login_screen/login_screen.dart';
import 'package:movies_app/view/screens/main_page/main_page.dart';
import 'package:movies_app/view/screens/movie_details_screen/movie_details_screen.dart';
import 'package:movies_app/view/screens/onboarding_screen/onboarding_screen.dart';
import 'package:movies_app/view/screens/register_screen/register_screen.dart';
import 'package:movies_app/view/screens/reset_password/reset_password_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    BaseTheme mainTheme = MainTheme();
    return MaterialApp(
      title: 'Movie app',
      debugShowCheckedModeBanner: false,
      theme: mainTheme.myThemeData,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: CacheHelper.getToken() == null
          ? ExploreScreen.routeName
          : MainPage.routeName,
      routes: {
        ExploreScreen.routeName: (context) => ExploreScreen(),
        OnboardingScreen.routeName: (context) => OnboardingScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        ForgetPasswordScreen.routeName: (context) => ForgetPasswordScreen(),
        MainPage.routeName: (context) => MainPage(),
        EditProfileScreen.routeName: (context) => EditProfileScreen(),
        MovieDetailsScreen.routeName: (context) => MovieDetailsScreen(),
        ResetPasswordScreen.routeName: (context) => ResetPasswordScreen()
      },
    );
  }
}

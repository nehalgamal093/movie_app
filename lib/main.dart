import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/providers/change_state.dart';
import 'package:movies_app/view/screens/app/my_app.dart';
import 'package:provider/provider.dart';
import 'caching/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ChangeState(),
        ),
      ],
      child: EasyLocalization(
        supportedLocales: const [Locale("en"), Locale("ar")],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: const MyApp(),
      ),
    ),
  );
}

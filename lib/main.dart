import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/providers/change_state.dart';
import 'package:provider/provider.dart';
import 'caching/cache_helper.dart';
import 'core/di/di.dart';
import 'features/app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
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

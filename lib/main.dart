import 'package:flutter/material.dart';
import 'package:movies_app/view/screens/app/my_app.dart';

import 'caching/cache_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(
    const MyApp(),
  );
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/onboarding_screen/providers/change_onboarding_provider.dart';
import 'package:movies_app/providers/change_state.dart';
import 'package:provider/provider.dart';
import 'caching/cache_helper.dart';
import 'core/di/di.dart';
import 'features/app/my_app.dart';
import 'features/profile/presentation/bloc/profile_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ProfileCubit>(),
        ),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ChangeState(),
          ),
          ChangeNotifierProvider(create: (context)=>ChangeOnboardingProvider())
        ],
        child: EasyLocalization(
          supportedLocales: const [Locale("en"), Locale("ar")],
          path: 'assets/translations',
          fallbackLocale: const Locale('en'),
          child: const MyApp(),
        ),
      ),
    ),
  );
}

import 'package:animeniac/features/auth/presentation/pages/splash_screen/splash_view.dart';

import 'package:sizer/sizer.dart';
import 'core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/cubit/theme_cubit.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
        return Sizer(builder: (context, orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Animeniac',
            theme: AppTheme.themeData(state.isDarkThemeOn, context),
            initialRoute: "/",
            routes: {"/": (context) => const SplashScreen()},
          );
        });
      }),
    );
  }
}
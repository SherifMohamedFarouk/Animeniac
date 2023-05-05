import 'package:animeniac/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:animeniac/features/auth/presentation/views/splash_view/splash_view.dart';
import 'package:animeniac/features/top_anime/presentation/anime_bloc/animes_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'features/top_manga/presentation/manga_bloc/mangas_bloc.dart';
import 'firebase_options.dart';
import 'package:sizer/sizer.dart';
import 'core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/cubit/theme_cubit.dart';
import 'injection_container.dart' as di;
import 'localization/app_localizations.dart';
import 'localization/lang_cubit/locale_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        BlocProvider(
          create: (_) => di.sl<AnimesBloc>()..add(GetTopAnimesEvent()),
        ),
        BlocProvider(
          create: (_) => di.sl<MangasBloc>()..add(GetTopMangasEvent()),
        ),
        BlocProvider(create: (_) => di.sl<AuthCubit>()),
        BlocProvider(
          create: (context) => LocaleCubit()..getSavedLanguage(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
        return BlocBuilder<LocaleCubit, ChangeLocaleState>(
            builder: (context, lstate) {
          return Sizer(builder: (context, orientation, deviceType) {
            return MaterialApp(
              locale: lstate.locale,
              supportedLocales: const [Locale('en'), Locale('ar')],
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              localeResolutionCallback: (deviceLocale, supportedLocales) {
                for (var locale in supportedLocales) {
                  if (deviceLocale != null &&
                      deviceLocale.languageCode == locale.languageCode) {
                    return deviceLocale;
                  }
                }

                return supportedLocales.first;
              },
              debugShowCheckedModeBanner: false,
              title: 'Animeniac',
              theme: AppTheme.themeData(state.isDarkThemeOn, context),
              initialRoute: "/",
              routes: {"/": (context) => const SplashView()},
            );
          });
        });
      }),
    );
  }
}

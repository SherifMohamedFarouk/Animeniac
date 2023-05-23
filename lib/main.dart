import 'package:loader_overlay/loader_overlay.dart';

import 'injection_container.dart' as di;
import 'localization/app_localizations.dart';
import 'localization/lang_cubit/locale_cubit.dart';
import 'main_imports.dart';

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
            return GlobalLoaderOverlay(
              child: MaterialApp(
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
                navigatorKey: CustomNavigator.navigatorState,
                initialRoute: Routes.splash,
                onGenerateRoute: CustomNavigator.onCreateRoute,
                navigatorObservers: [CustomNavigator.routeObserver],
              ),
            );
          });
        });
      }),
    );
  }
}

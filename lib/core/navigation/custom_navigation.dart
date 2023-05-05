import 'package:animeniac/features/watch_list/watch_list.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/sign_in_view/sign_in_view.dart';
import '../../features/auth/presentation/views/sign_up_view/sign_up_view.dart';
import '../../features/auth/presentation/views/splash_view/splash_view.dart';
import 'routes.dart';

abstract class CustomNavigator {
  static final GlobalKey<NavigatorState> navigatorState =
      GlobalKey<NavigatorState>();
  static final RouteObserver<PageRoute> routeObserver =
      RouteObserver<PageRoute>();

  static Route<dynamic> onCreateRoute(RouteSettings settings) {
    var arguments = settings.arguments;

    switch (settings.name) {
      // case Routes.APP:
      //   return MaterialPageRoute(builder: (_) => MyApp());
      case Routes.SPLASH:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.SIGN_IN:
        return MaterialPageRoute(builder: (_) => const SignInView());
      case Routes.SIGN_UP:
        return MaterialPageRoute(builder: (_) => const SignUpView());
      case Routes.WATCH_LIST:
        return MaterialPageRoute(builder: (_) => const WatchListView());
      default:
        return MaterialPageRoute(builder: (_) => const SplashView());
    }
  }

  static void pop({dynamic result}) {
    if (navigatorState.currentState!.canPop()) {
      navigatorState.currentState!.pop(result);
    }
  }

  static Future push(String routeName,
      {arguments,
      bool replace = false,
      bool clean = false,
      bool isFirst = false}) {
    if (clean) {
      return navigatorState.currentState!.pushNamedAndRemoveUntil(routeName,
          isFirst ? (Route<dynamic> route) => route.isFirst : (_) => false,
          arguments: arguments);
    } else if (replace) {
      return navigatorState.currentState!
          .pushReplacementNamed(routeName, arguments: arguments);
    } else {
      return navigatorState.currentState!
          .pushNamed(routeName, arguments: arguments);
    }
  }
}

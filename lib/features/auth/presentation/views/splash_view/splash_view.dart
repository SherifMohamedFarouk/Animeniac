import '../../../../../core/navigation/custom_navigation.dart';
import 'package:flutter/material.dart';

import '../../../../../core/navigation/routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Future<void> navigateToSignIn() async {
    await Future.delayed(const Duration(seconds: 2), () async {
      CustomNavigator.push(Routes.main, clean: true);
    });
  }

  @override
  void initState() {
    super.initState();
    navigateToSignIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            "assets/images/Animeniac.png",
          )),
        ],
      ),
    );
  }
}

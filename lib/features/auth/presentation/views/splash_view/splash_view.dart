import 'package:animeniac/features/nav_screen/nav_bar_screen.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Future<void> navigateToSignIn() async {
    await Future.delayed(const Duration(seconds: 2), () async {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (BuildContext context) {
            return const NavBarScreen();
          },
        ),
        (_) => false,
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
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

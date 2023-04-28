import 'package:animeniac/features/auth/presentation/pages/login_page/login_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> navigateToSignIn() async {
    await Future.delayed(const Duration(seconds: 2), () async {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (BuildContext context) {
            return const LoginPage();
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
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
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

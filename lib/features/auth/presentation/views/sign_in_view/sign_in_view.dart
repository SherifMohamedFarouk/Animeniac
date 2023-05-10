import 'sign_in_imports.dart';

class SignInView extends StatefulWidget {
  const SignInView({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: loginBody(screenWidth, screenHeight, context),
    );
  }

  SignInBody loginBody(
      double screenWidth, double screenHeight, BuildContext context) {
    return const SignInBody();
  }
}

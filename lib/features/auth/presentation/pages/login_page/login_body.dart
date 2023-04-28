import './login_imports.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showPassword = false;
  bool validateEmail = false;
  String emailErrorText = "";
  bool validatePassword = false;
  String passwordText = "";
  bool isEmailDone = false;
  bool isPasswordDone = false;
  void emailCheck() {
    if (emailController.text.isEmpty) {
      setState(() {
        emailErrorText = "Please enter an email";
        validateEmail = true;
      });
    } else if (!emailController.text.isValidEmail) {
      setState(() {
        emailErrorText = "Please enter a valid email";
        validateEmail = true;
      });
    } else if (emailController.text.isValidEmail) {
      setState(() {
        validateEmail = false;
        emailErrorText = "";
      });
    } else {
      setState(() {
        validateEmail = false;
        emailErrorText = "";
      });
    }
  }

  void passwordCheck() {
    if (passwordController.text.isEmpty) {
      setState(() {
        validatePassword = true;
      });
    } else if (!passwordController.text.isValidPassword) {
      setState(() {
        validatePassword = true;
      });
    } else if (passwordController.text.isValidPassword) {
      setState(() {
        validatePassword = false;
      });
    } else {
      setState(() {
        validatePassword = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController.addListener(() {});
    passwordController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.053),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.1,
                ),
                Center(
                  child: Image.asset('assets/images/Animeniac.png'),
                ),
                SizedBox(
                  height: screenHeight * 0.1,
                ),
              ],
            ),
            CustomTextFieldForAuth(
              textEditingController: emailController,
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
              hintText: "Email",
              labelText: "Email",
              onEditingComplete: () async {
                FocusScope.of(context).unfocus();
              },
              onChanged: (value) {
                emailCheck();
              },
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            CustomTextFieldForAuth(
              textEditingController: passwordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: !showPassword,
              hintText: "Password",
              labelText: "Password",
              onEditingComplete: () async {
                FocusScope.of(context).unfocus();
              },
              onChanged: (value) {
                passwordCheck();
              },
              suffixIcon: !showPassword
                  ? IconButton(
                      icon: Icon(FeatherIcons.eyeOff,
                          size: 22,
                          color: passwordController.text.isNotEmpty
                              ? primaryColor
                              : primaryColor.withOpacity(.50)),
                      onPressed: () {
                        setState(() => showPassword = !showPassword);
                      },
                    )
                  : IconButton(
                      onPressed: () =>
                          setState(() => showPassword = !showPassword),
                      icon: Icon(FeatherIcons.eye,
                          size: 22,
                          color: passwordController.text.isNotEmpty
                              ? primaryColor
                              : primaryColor.withOpacity(.50)),
                    ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const ForgetPassword(),
                //   ),
                // );
              },
              child: const Text(
                "Forgot Password?",
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            LoginButton(
                padding: const EdgeInsets.all(0),
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                title: "Login",
                onPressed: emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty
                    ? () {}
                    : null),
            SizedBox(height: screenHeight * 0.032),
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "New to Animeniac? ",
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                    ),
                    WidgetSpan(
                        child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.3),
          ],
        ),
      ),
    );
  }
}

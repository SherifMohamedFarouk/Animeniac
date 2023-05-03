import 'package:animeniac/features/auth/domain/entites/user_data.dart';
import 'package:animeniac/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './signup_imports.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool showPassword = false;
  bool showConfirmPassword = false;
  bool validatePassword = false;
  bool validateEmail = false;
  bool validateName = false;
  bool validateConfirmPassword = false;
  bool isButtonEnabled = false;
  bool isEmailRegistered = false;
  String? errorMessage;
  String emailErrorText = "";
  String passwordText = "";
  String confirmPasswordText = "";
  String validateNameText = "";

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(screenWidth, screenHeight * 0.07),
          child: const AppBarWidget(
            title: "Sign up",
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.053),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight * 0.04,
              ),
              CustomTextFieldForAuth(
                validate: validateName,
                textEditingController: nameController,
                keyboardType: TextInputType.name,
                obscureText: false,
                hintText: "Enter Name",
                labelText: "Name",
                errorText: validateName ? validateNameText : "",
                onEditingComplete: () async {
                  FocusScope.of(context).unfocus();
                },
                onChanged: (value) {
                  nameCheck();
                },
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              CustomTextFieldForAuth(
                  validate: validateEmail,
                  textEditingController: emailController,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  hintText: "Email",
                  labelText: "Email",
                  errorText: validateEmail ? emailErrorText : "",
                  onFieldSubmitted: (value) {
                    emailCheck();
                  },
                  onChanged: (value) {
                    emailCheck();
                  },
                  onEditingComplete: () async {
                    FocusScope.of(context).unfocus();
                  },
                  textStyle: TextStyle(
                    color: !validateEmail ? blackColor : errorColor,
                  )),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              CustomTextFieldForAuth(
                  textEditingController: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !showPassword,
                  hintText: "Password",
                  labelText: "Password",
                  validate: validatePassword,
                  suffixIcon: !showPassword
                      ? IconButton(
                          icon: Icon(
                            FeatherIcons.eyeOff,
                            size: 22,
                            color: passwordController.text.isNotEmpty
                                ? primaryColor
                                : primaryColor.withOpacity(.50),
                          ),
                          onPressed: () {
                            setState(() => showPassword = !showPassword);
                          },
                        )
                      : IconButton(
                          onPressed: () =>
                              setState(() => showPassword = !showPassword),
                          icon: Icon(
                            FeatherIcons.eye,
                            size: 22,
                            color: passwordController.text.isNotEmpty
                                ? primaryColor
                                : primaryColor.withOpacity(.50),
                          ),
                        ),
                  errorText: validatePassword ? passwordText : "",
                  onFieldSubmitted: (value) {
                    passwordCheck();
                  },
                  onChanged: (value) {
                    passwordCheck();
                  },
                  onEditingComplete: () async {
                    FocusScope.of(context).unfocus();
                  },
                  textStyle: TextStyle(
                    color: !validatePassword ? blackColor : errorColor,
                  )),
              SizedBox(
                height: screenHeight * 0.006,
              ),
              const Text(
                "Password should contain upper case, lower case, number, symbol, 8 characters at least",
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              CustomTextFieldForAuth(
                  validate: validateConfirmPassword,
                  textEditingController: confirmPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !showConfirmPassword,
                  hintText: "Confirm Password",
                  labelText: "Confirm Password",
                  suffixIcon: !showConfirmPassword
                      ? IconButton(
                          icon: Icon(FeatherIcons.eyeOff,
                              size: 22,
                              color: confirmPasswordController.text.isNotEmpty
                                  ? primaryColor
                                  : primaryColor.withOpacity(.50)),
                          onPressed: () {
                            setState(() =>
                                showConfirmPassword = !showConfirmPassword);
                          },
                        )
                      : IconButton(
                          onPressed: () => setState(
                              () => showConfirmPassword = !showConfirmPassword),
                          icon: Icon(
                            FeatherIcons.eye,
                            size: 22,
                            color: confirmPasswordController.text.isNotEmpty
                                ? primaryColor
                                : primaryColor.withOpacity(.50),
                          ),
                        ),
                  errorText: validateConfirmPassword ? confirmPasswordText : "",
                  onFieldSubmitted: (value) {
                    confirmPasswordCheck();
                  },
                  onChanged: (value) {
                    confirmPasswordCheck();
                  },
                  onEditingComplete: () async {
                    FocusScope.of(context).unfocus();
                  },
                  textStyle: TextStyle(
                    color: !validateConfirmPassword ? blackColor : errorColor,
                  )),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              SizedBox(
                height: screenHeight * 0.06,
              ),
              LoginButton(
                padding: const EdgeInsets.all(0),
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                title: "Sign Up",
                onPressed: !(emailController.text.isValidEmail &&
                        passwordController.text.isValidPassword &&
                        confirmPasswordController.text ==
                            passwordController.text &&
                        nameController.text.isNotEmpty)
                    ? null
                    : () {
                  signUp();
                },
              ),
              SizedBox(height: screenHeight * 0.03),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Have an Account?",
                      overflow: TextOverflow.ellipsis,
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                            (route) => false);
                      },
                      child:
                          const Text(" Login", overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.3),
            ],
          ),
        ),
      ),
    );
  }
  void signUp() {

    BlocProvider.of<AuthCubit>(context).signUp(
        email: emailController.text,
        name: nameController.text,
        password: passwordController.text,
    );
  }

  // functions
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
      });
    } else {
      setState(() {
        validateEmail = false;
      });
    }
  }

  void passwordCheck() {
    if (passwordController.text.isEmpty) {
      setState(() {
        validatePassword = true;
        passwordText = "Please enter a password";
      });
    } else if (!passwordController.text.isValidPassword) {
      setState(() {
        validatePassword = true;
        passwordText = "Please enter a valid password";
      });
    } else if (passwordController.text.isValidPassword) {
      setState(() {
        validatePassword = false;
        passwordText = "";
      });
    } else {
      setState(() {
        validatePassword = false;
        passwordText = "";
      });
    }
  }

  void confirmPasswordCheck() {
    if (passwordController.text.isEmpty) {
      setState(() {
        validateConfirmPassword = true;
        confirmPasswordText = "Please enter a confirm password";
      });
    } else if (passwordController.text != confirmPasswordController.text) {
      setState(() {
        validateConfirmPassword = true;
        confirmPasswordText = "";
      });
    } else {
      setState(() {
        validateConfirmPassword = false;
        confirmPasswordText = "";
      });
    }
  }

  void nameCheck() {
    if (nameController.text.isEmpty) {
      setState(() {
        validateName = true;
        validateNameText = "field is empty";
      });
    } else if (!nameController.text.isValidName) {
      setState(() {
        validateName = true;
        validateNameText = "Please enter a valid name";
      });
    } else if (nameController.text.isValidName) {
      setState(() {
        validateName = false;
        validateNameText = "";
      });
    } else {
      setState(() {
        validateName = false;
        validateNameText = "";
      });
    }
  }
}

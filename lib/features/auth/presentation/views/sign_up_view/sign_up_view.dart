import 'package:animeniac/core/global_widgets/lottie_animations/naruto_loader.dart';
import 'package:animeniac/core/navigation/custom_navigation.dart';
import 'package:animeniac/localization/app_localizations.dart';
import 'package:loader_overlay/loader_overlay.dart';

import './sign_up_imports.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
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
          child: AppBarWidget(
            title: "sign_up".tr(context),
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
                textAlign: TextAlign.justify,
                hintText: "enter_name".tr(context),
                labelText: "name".tr(context),
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
                  textAlign: TextAlign.justify,
                  hintText: "email".tr(context),
                  labelText: "email".tr(context),
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
                    color: !validateEmail
                        ? Theme.of(context).colorScheme.onPrimary
                        : errorColor,
                  )),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              CustomTextFieldForAuth(
                  textEditingController: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !showPassword,
                  textAlign: TextAlign.justify,
                  hintText: "password".tr(context),
                  labelText: "password".tr(context),
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
                    color: !validatePassword
                        ? Theme.of(context).colorScheme.onPrimary
                        : errorColor,
                  )),
              SizedBox(
                height: screenHeight * 0.006,
              ),
              Text(
                "pw_text".tr(context),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              CustomTextFieldForAuth(
                  validate: validateConfirmPassword,
                  textEditingController: confirmPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !showConfirmPassword,
                  textAlign: TextAlign.justify,
                  hintText: "confirm_password".tr(context),
                  labelText: "confrim_password".tr(context),
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
                    color: !validateConfirmPassword
                        ? Theme.of(context).colorScheme.onPrimary
                        : errorColor,
                  )),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              SizedBox(
                height: screenHeight * 0.06,
              ),
              BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthLoading) {
                    context.loaderOverlay
                        .show(widget: const ProcessingOverLay());
                  } else if (state is AuthSuccess) {
                    CustomNavigator.pop();
                    context.loaderOverlay.hide();
                  } else if (state is AuthFailure) {
                    context.loaderOverlay.hide();
                  }
                },
                child: LoginButton(
                  padding: const EdgeInsets.all(0),
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  title: "sign_up".tr(context),
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
              ),
              SizedBox(height: screenHeight * 0.03),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "have_acc".tr(context),
                      overflow: TextOverflow.ellipsis,
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text("log_in".tr(context),
                          overflow: TextOverflow.ellipsis),
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

  signUp() {
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
        emailErrorText = "enter_email".tr(context);
        validateEmail = true;
      });
    } else if (!emailController.text.isValidEmail) {
      setState(() {
        emailErrorText = "enter_valid_email".tr(context);
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
        passwordText = "enter_pw".tr(context);
      });
    } else if (!passwordController.text.isValidPassword) {
      setState(() {
        validatePassword = true;
        passwordText = "enter_valid_pw".tr(context);
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
        confirmPasswordText = "enter_confirm_pw".tr(context);
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
        validateNameText = "empty_field".tr(context);
      });
    } else if (!nameController.text.isValidName) {
      setState(() {
        validateName = true;
        validateNameText = "enter_valid_name".tr(context);
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

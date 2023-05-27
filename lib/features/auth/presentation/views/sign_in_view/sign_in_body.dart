import 'package:sizer/sizer.dart';

import '../../../../../core/global_widgets/login_top_bar.dart';
import '../../../../../core/util/snackbar_message.dart';
import 'sign_in_imports.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({super.key});

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showPassword = false;
  bool validateEmail = false;
  String emailErrorText = "";
  bool validatePassword = false;
  String passwordText = "";
  bool isEmailDone = false;
  bool isPasswordDone = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {});
    passwordController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const LoginTopBar(title: 'Login To Make A WatchList'),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: Image.asset('assets/images/Animeniac.png'),
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
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
                onEditingComplete: () async {
                  FocusScope.of(context).unfocus();
                },
                onChanged: (value) {
                  emailCheck();
                },
                textStyle: TextStyle(
                  color: !validateEmail
                      ? Theme.of(context).colorScheme.onPrimary
                      : errorColor,
                )),
            SizedBox(
              height: 2.h,
            ),
            CustomTextFieldForAuth(
              textEditingController: passwordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: !showPassword,
              textAlign: TextAlign.justify,
              hintText: "password".tr(context),
              labelText: "password".tr(context),
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
              height: 2.h,
            ),
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {},
              child: Text(
                "forgot_pw".tr(context),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthLoading) {
                  context.loaderOverlay.show(widget: const ProcessingOverLay());
                } else if (state is AuthSuccess) {
                  CustomNavigator.push(Routes.main, clean: true);

                  context.loaderOverlay.hide();
                  SnackBarMessage().showSuccessSnackBar(
                      message: "You've Succesfully Logged In",
                      context: context);
                } else if (state is AuthFailure) {
                  context.loaderOverlay.hide();
                  SnackBarMessage().showErrorSnackBar(
                      message:
                          "Invalid Credentials Or Network Error, PLease Try Again!",
                      context: context);
                }
              },
              child: LoginButton(
                  padding: const EdgeInsets.all(0),
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  title: "log_in".tr(context),
                  onPressed: emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty
                      ? () {
                          signIn();
                        }
                      : null),
            ),
            SizedBox(height: 3.h),
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "new".tr(context),
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                    ),
                    WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: InkWell(
                          onTap: () {
                            CustomNavigator.push(Routes.signUp);
                          },
                          child: Text(
                            "sign_up".tr(context),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(height: 25.h),
          ],
        ),
      ),
    );
  }

  //functions

  signIn() {
    BlocProvider.of<AuthCubit>(context).signIn(
      email: emailController.text,
      password: passwordController.text,
    );
  }

  //validation functions
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
}

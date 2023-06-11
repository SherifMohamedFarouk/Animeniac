import '../../../../../core/shared/extentions/validation.dart';
import '../../../../top_anime/presentation/widgets/anime_details_widgets/widgets.imports.dart';

import 'package:loader_overlay/loader_overlay.dart';

import '../../widgets/auth_widgets/login_button_widget.dart';

import '../../widgets/auth_widgets/custom_text_field_for_auth.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController emailController = TextEditingController();

  bool checkedValue = false;
  String? selectedValue;

  bool validateEmail = false;
  bool isButtonEnabled = false;
  bool isEmailRegistered = false;
  String? errorMessage;
  String emailErrorText = "";
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
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
        appBar: AppBar(centerTitle: true, title: const Text('Reset Password')),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.053),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Receive an email to reset your password',
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Form(
                  child: CustomTextFieldForAuth(
                      validate: validateEmail,
                      textEditingController: emailController,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      hintText: "Email",
                      labelText: "Email",
                      errorText: validateEmail ? emailErrorText : "",
                      onTap: () {
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
                ),
                SizedBox(
                  height: 3.h,
                ),
                LoginButton(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.0133,
                  ),
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  title: "Reset Password",
                  onPressed: emailController.text.isNotEmpty
                      ? () {
                          resetPassword();
                        }
                      : null,
                ),
              ]),
        ),
      ),
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
        //isEmailExist();
      });
    } else {
      setState(() {
        validateEmail = false;
      });
    }
  }

  Future resetPassword() async {
    context.loaderOverlay.show();
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      CustomNavigator.pop();

      SnackBarMessage().showSuccessSnackBar(
          message: "Password Reset Email Sent", context: context);

      context.loaderOverlay.hide();
    } on FirebaseAuthException catch (error) {
      SnackBarMessage().showErrorSnackBar(message: "$error", context: context);
      context.loaderOverlay.hide();
    }
  }
}

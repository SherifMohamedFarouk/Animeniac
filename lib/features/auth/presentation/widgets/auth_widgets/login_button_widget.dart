import 'package:animeniac/core/color/colors.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    this.screenHeight,
    this.screenWidth,
    this.onPressed,
    this.title,
    this.padding,
  }) : super(key: key);

  final double? screenHeight;
  final double? screenWidth;
  final VoidCallback? onPressed;
  final String? title;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: padding!,
        child: SizedBox(
          height: screenHeight! * 0.07,
          width: screenWidth,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              backgroundColor: primaryColor,
            ),
            child: Text(
              title!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: onPressed == null ? secondaryColor : Colors.white,
                  ),
            ),
          ),
        ));
  }
}

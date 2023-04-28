import 'package:animeniac/core/color/colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {Key? key,
      required this.label,
      required this.action,
      required this.padding})
      : super(key: key);
  final String label;
  final VoidCallback? action;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: padding,
      child: InkWell(
        onTap: action,
        child: Container(
            width: double.infinity,
            height: screenHeight * 0.063,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: primaryColor,
            ),
            child: Center(
              child: Text(
                label,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
              ),
            )),
      ),
    );
  }
}

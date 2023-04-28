import 'package:flutter/material.dart';

class SettingOptionWidget extends StatelessWidget {
  const SettingOptionWidget({
    Key? key,
    this.title,
    this.iconWidget,
  }) : super(key: key);

  final String? title;
  final Widget? iconWidget;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title!,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
            ),
            Spacer(),
            iconWidget!,
          ],
        ),
      ],
    );
  }
}

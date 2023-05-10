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
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
            ),
            const Spacer(),
            iconWidget!,
          ],
        ),
      ],
    );
  }
}

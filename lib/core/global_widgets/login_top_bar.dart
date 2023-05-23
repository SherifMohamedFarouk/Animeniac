import 'package:flutter/material.dart';

import '../color/colors.dart';
import '../navigation/custom_navigation.dart';

class LoginTopBar extends StatelessWidget implements PreferredSizeWidget {
  const LoginTopBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, color: secondaryColor),
        ),
        leading: IconButton(
          onPressed: () {
            CustomNavigator.pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
          ),
        ));
  }
}

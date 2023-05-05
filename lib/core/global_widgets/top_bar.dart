import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({
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
      title: Image.asset(
        title,
        fit: BoxFit.cover,
        height: 5.h,
        width: 50.w,
      ),
      // leading: IconButton(
      //   onPressed: () {},
      //   icon: const Icon(
      //     Icons.arrow_back_ios_new_rounded,
      //     size: 20,
      //   ),
      // )
    );
  }
}

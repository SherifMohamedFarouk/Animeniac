import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({
    super.key,
    required this.title,
    required this.page,
  });

  final String title;
  final String page;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: ListTile(
        trailing: Text(
          page,
          style: TextStyle(fontSize: 20),
        ),
        leading: Image.asset(
          title,
          fit: BoxFit.cover,
          height: 5.h,
          width: 50.w,
        ),
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

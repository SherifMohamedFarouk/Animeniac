import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget {
  final String title;

  const AppBarWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return AppBar(
      backgroundColor: Colors.transparent,
      // systemOverlayStyle: SystemUiOverlayStyle(),
      elevation: 0,
      centerTitle: true,
      title: Text(
        widget.title,
      ),
      leading: Container(
        margin: const EdgeInsets.all(9.9),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }
}

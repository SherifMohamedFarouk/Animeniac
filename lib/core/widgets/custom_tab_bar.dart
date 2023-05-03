import 'package:flutter/material.dart';

import '../color/colors.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function action;
  final bool isBottomIndicator;

  const CustomTabBar(
      {Key? key,
      required this.icons,
      required this.selectedIndex,
      required this.action,
      this.isBottomIndicator = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
          border: isBottomIndicator
              ? const Border(
                  bottom: BorderSide(
                  width: 3,
                ))
              : const Border(
                  top: BorderSide(
                  width: 3,
                ))),
      tabs: icons
          .asMap()
          .map((i, e) => MapEntry(
                i,
                Tab(
                  icon: Icon(
                    e,
                    color: i == selectedIndex ? primaryColor : Colors.black45,
                    size: 30,
                  ),
                ),
              ))
          .values
          .toList(),
      onTap: action(),
    );
  }
}

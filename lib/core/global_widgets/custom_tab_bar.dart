import 'package:flutter/material.dart';

import '../color/colors.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) action;
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
      tabs: icons
          .asMap()
          .map((i, e) => MapEntry(
                i,
                Tab(
                  icon: Icon(
                    e,
                    color: i != selectedIndex
                        ? Theme.of(context).colorScheme.onSecondary
                        : primaryColor,
                    size: 30,
                  ),
                ),
              ))
          .values
          .toList(),
      onTap: action,
    );
  }
}

import 'package:animeniac/features/top_anime/presentation/views/top_anime_view.dart';
import 'package:flutter/material.dart';

import '../util/responsive.dart';
import 'custom_app_bar.dart';
import 'custom_tab_bar.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final List<Widget> _screens = [
    const TopAnimeView()
    // Scaffold(),
    // Scaffold(),
    // Scaffold(),
    // Scaffold(),
  ];
  final List<IconData> _icons = const [
    Icons.home,
    Icons.ondemand_video,
    Icons.home,
    Icons.menu,
    Icons.home,
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
        length: _icons.length,
        child: Scaffold(
          appBar: Responsive.isDesktop(context)
              ? PreferredSize(
                  preferredSize: Size(screenSize.width, 100),
                  child: CustomAppBar(
                      icons: _icons,
                      selectedIndex: _selectedIndex,
                      onTap: (index) => setState(() => _selectedIndex = index)),
                )
              : null,
          body: IndexedStack(index: _selectedIndex, children: _screens),
          bottomNavigationBar: !Responsive.isDesktop(context)
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: CustomTabBar(
                      icons: _icons,
                      selectedIndex: _selectedIndex,
                      action: (index) => setState(
                            () => _selectedIndex = index,
                          )),
                )
              : const SizedBox.shrink(),
        ));
  }
}

import 'package:animeniac/features/auth/presentation/pages/login_page/login_page.dart';
import 'package:animeniac/features/settings/settings_screen.dart';
import 'package:animeniac/features/top_anime/presentation/views/top_anime_view.dart';
import 'package:flutter/material.dart';

import '../../core/global_widgets/custom_tab_bar.dart';
import '../../core/global_widgets/top_bar.dart';
import '../top_manga/presentation/views/top_manga_view.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({Key? key}) : super(key: key);

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  final List<Widget> _screens = [
    const TopAnimeView(),
    const TopMangaView(),
    const LoginPage(),
    const SettingsScreen()

    // Scaffold(),
    // Scaffold(),
    // Scaffold(),
  ];
  final List<IconData> _icons = const [
    Icons.ondemand_video,
    Icons.menu_book_sharp,
    Icons.person,
    Icons.settings
    // Icons.home,
    // Icons.menu,
    // Icons.home,
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
        length: _icons.length,
        child: Scaffold(
            appBar: const TopBar(
              title: 'assets/images/Animeniac.png',
            ),
            //  Responsive.isDesktop(context)
            //     ? PreferredSize(
            //         preferredSize: Size(screenSize.width, 100),
            //         child: CustomAppBar(
            //             icons: _icons,
            //             selectedIndex: _selectedIndex,
            //             onTap: (index) => setState(() => _selectedIndex = index)),
            //       )
            // : null

            body: IndexedStack(index: _selectedIndex, children: _screens),
            bottomNavigationBar:
                //  !Responsive.isDesktop(context)
                //     ?
                Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: CustomTabBar(
                  icons: _icons,
                  selectedIndex: _selectedIndex,
                  action: (index) => setState(
                        () => _selectedIndex = index,
                      )),
            )
            // : const SizedBox.shrink(),
            ));
  }
}

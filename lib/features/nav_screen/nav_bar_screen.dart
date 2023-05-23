import 'package:firebase_auth/firebase_auth.dart';

import '../search/presentation/views/search_view.dart';
import '../watch_list/presentation/views/watch_list.dart';
import 'nav_bar_imports.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({Key? key}) : super(key: key);

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  final List<Widget> _screens = [
    const TopAnimeView(),
    const TopMangaView(),
    const SearchView(),
    const WatchListView(),
    const SettingsScreen(),
  ];
  final List<IconData> _icons = const [
    Icons.ondemand_video,
    Icons.menu_book_sharp,
    Icons.search_sharp,
    Icons.list_alt_sharp,
    Icons.settings,
  ];
  final List<Widget> _screens2 = [
    const TopAnimeView(),
    const TopMangaView(),
    const SearchView(),
    const SettingsScreen(),
  ];
  final List<IconData> _icons2 = const [
    Icons.ondemand_video,
    Icons.menu_book_sharp,
    Icons.search_sharp,
    Icons.settings,
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    // final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
        length: FirebaseAuth.instance.currentUser != null
            ? _icons.length
            : _icons2.length,
        child: Scaffold(

            //  Responsive.isDesktop(context)
            //     ? PreferredSize(
            //         preferredSize: Size(screenSize.width, 100),
            //         child: CustomAppBar(
            //             icons: _icons,
            //             selectedIndex: _selectedIndex,
            //             onTap: (index) => setState(() => _selectedIndex = index)),
            //       )
            // : null

            body: IndexedStack(
                index: _selectedIndex,
                children: FirebaseAuth.instance.currentUser != null
                    ? _screens
                    : _screens2),
            bottomNavigationBar:
                //  !Responsive.isDesktop(context)
                //     ?
                Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: CustomTabBar(
                  icons: FirebaseAuth.instance.currentUser != null
                      ? _icons
                      : _icons2,
                  selectedIndex: _selectedIndex,
                  action: (index) => setState(
                        () => _selectedIndex = index,
                      )),
            )
            // : const SizedBox.shrink(),
            ));
  }
}

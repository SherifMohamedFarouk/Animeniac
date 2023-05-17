import '../search/presentation/views/search_view.dart';
import 'nav_bar_imports.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({Key? key}) : super(key: key);

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  final List<Widget> _screens = [
    const TopAnimeView(),
    const TopMangaView(),
    const SearchView(),
    const SignInView(),
    const SettingsScreen()
  ];
  final List<IconData> _icons = const [
    Icons.ondemand_video,
    Icons.menu_book_sharp,
    Icons.search_sharp,
    Icons.person,
    Icons.settings
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    // final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
        length: _icons.length,
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

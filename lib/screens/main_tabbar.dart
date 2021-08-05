import 'package:flutter/material.dart';
import 'package:pet_shop/core/color_palette.dart';
import 'package:pet_shop/screens/home_screen.dart';

class MainTabBarScreen extends StatefulWidget {
  MainTabBarScreen({Key? key}) : super(key: key);

  @override
  _MainTabBarScreenState createState() => _MainTabBarScreenState();
}

class _MainTabBarScreenState extends State<MainTabBarScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final List<IconData> _icons = [
    Icons.home_outlined,
    Icons.chat_outlined,
    Icons.notifications_outlined,
    Icons.person_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _screens.length,
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(bottom: 12.0),
          height: 76.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 4,
                  offset: Offset(0, 2)),
            ],
          ),
          child: CustomTabBar(
              icons: _icons,
              selectedIndex: _selectedIndex,
              onTap: (index) => setState(() => _selectedIndex = index)),
        ),
      ),
    );
  }
}

class CustomTabBar extends StatelessWidget {
  final List<IconData>? icons;
  final int? selectedIndex;
  final Function(int)? onTap;

  const CustomTabBar({
    Key? key,
    @required this.icons,
    @required this.selectedIndex,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicatorColor: Colors.transparent,
      tabs: icons!
          .asMap()
          .map((i, e) => MapEntry(
                i,
                Tab(
                  icon: Icon(
                    e,
                    color: i == selectedIndex
                        ? Palette.gMainColor
                        : Colors.blueGrey,
                    size: 30.0,
                  ),
                ),
              ))
          .values
          .toList(),
      onTap: onTap,
    );
  }
}

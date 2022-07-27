import 'package:flutter/material.dart';
import 'package:meal_monkey/constants/constants.dart';
import 'package:meal_monkey/views/main/home/home_screen.dart';
import 'package:meal_monkey/views/main/menu/menu_screen.dart';
import 'package:meal_monkey/views/main/more.dart';
import 'package:meal_monkey/views/main/offers.dart';
import 'package:meal_monkey/views/main/profile.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pages = [
    const MenuScreen(),
    const OffersScreen(),
    const ProfileScreen(),
    const MoreScreen(),
    const HomeScreen(),
  ];
  List<String> navItems = [
    'assets/images/menu.png',
    'assets/images/offerss.png',
    'assets/images/profile.png',
    'assets/images/more.png',
  ];

  int _pageIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_pageIndex],
      bottomNavigationBar: _buildNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildNavigationBar() {
    return AnimatedBottomNavigationBar.builder(
      backgroundColor: Colors.white,
      activeIndex: _pageIndex,
      gapLocation: GapLocation.center,
      splashSpeedInMilliseconds: 300,
      notchSmoothness: NotchSmoothness.softEdge,
      onTap: (index) => setState(() => _pageIndex = index),
      tabBuilder: (index, isActive) => GestureDetector(
        child: Image.asset(
          navItems[index],
          color: isActive ? orange : grey,
        ),
      ),
      itemCount: 4,
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () => setState(() {
        _pageIndex = 4;
      }),
      backgroundColor: _pageIndex == 4 ? orange : grey,
      child:
          Image.asset('assets/images/home.png', color: Colors.white, width: 22),
    );
  }
}

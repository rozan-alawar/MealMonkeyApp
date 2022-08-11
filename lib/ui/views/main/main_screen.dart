import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../component/constants.dart';
import 'home/home_screen.dart';
import 'menu/menu_screen.dart';
import 'more/more.dart';
import 'offers.dart';
import 'profile.dart';

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
    'assets/images/icons/menu.png',
    'assets/images/icons/offerss.png',
    'assets/images/icons/profile.png',
    'assets/images/icons/more.png'
  ];

  int _pageIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: pages[_pageIndex],
      bottomNavigationBar: _buildNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFloatingActionButton(),
      extendBody: true,
    );
  }

  // Widget _buildNavigationBar() {
  //   return BottomAppBar(
  //     elevation: 10,
  //     notchMargin: 10,
  //     shape: const CircularNotchedRectangle(),
  //     child: SizedBox(
  //       height: 59.h,
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //         children: [
  //           Image.asset('assets/images/icons/menu.png'),
  //           Image.asset('assets/images/icons/offerss.png'),
  //           SizedBox(width: 50.w),
  //           Image.asset('assets/images/icons/profile.png'),
  //           Image.asset('assets/images/icons/more.png'),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _buildNavigationBar() {
    return AnimatedBottomNavigationBar.builder(
      activeIndex: _pageIndex,
      height: 60.h,
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
      elevation: 10,
      onPressed: () => setState(() {
        _pageIndex = 4;
      }),
      backgroundColor: _pageIndex == 4 ? orange : grey,
      child:
          Image.asset('assets/images/icons/home.png', color: white, width: 22),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../component/constants.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/search_food_box.dart';
import '../../../widgets/sub_text.dart';
import '../../../view_models/menu_items.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(55), child: MyAppBar(title: 'Menu')),
      body: Column(
        children: [
          FoodSearchBox(searchController: searchController),
          SizedBox(
            width: double.infinity,
            child: Stack(
              children: [_buildSideBar(), _buildMenuList()],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSideBar() {
    return Container(
      width: 97.w,
      height: 505.h,
      decoration: const BoxDecoration(
        color: orange,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
    );
  }

  Widget _buildMenuList() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20),
      child: SizedBox(
        width: 350.w,
        height: 450.h,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: MenuItems.menuItems.length,
          itemBuilder: (context, index) => _buildMenuCard(index),
        ),
      ),
    );
  }

  Widget _buildMenuCard(int index) {
    return SizedBox(
      height: 110.h,
      width: 320.w,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTypeImage(index),
              _buildArrowButton(index),
            ],
          ),
          _buildTypeName(index),
        ],
      ),
    );
  }

  Widget _buildTypeImage(int index) {
    return SizedBox(
      child: Image.asset(
        MenuItems.menuItems[index].image,
        width: 80.w,
        height: 90.h,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildTypeName(int index) {
    return SizedBox(
      width: 290.w,
      height: 87.h,
      child: Material(
        elevation: 15,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              MenuItems.menuItems[index].name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SmallText(text: MenuItems.menuItems[index].itemCount)
          ],
        ),
      ),
    );
  }

  Widget _buildArrowButton(int index) {
    return Material(
      borderRadius: BorderRadius.circular(25),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: IconButton(
          icon: const Icon(Icons.arrow_forward_ios_rounded, color: orange),
          onPressed: MenuItems.menuItems[index].page,
        ),
      ),
    );
  }
}

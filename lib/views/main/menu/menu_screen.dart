import 'package:flutter/material.dart';
import 'package:meal_monkey/constants/constants.dart';
import 'package:meal_monkey/models/menu_items.dart';
import 'package:meal_monkey/responsive/device_info.dart';
import 'package:meal_monkey/widgets/custom_widget.dart';

import '../../../responsive/base_widget.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      builder: (context, deviceInfo) => Scaffold(
        appBar: myAppBar(text: 'Menu'),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              const SizedBox(height: 0),
              buildSearchFoodBox(deviceInfo, searchController),
              _buildSideBar(deviceInfo),
              _buildMenuList(deviceInfo)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSideBar(DeviceInfo deviceInfo) {
    return Padding(
      padding: const EdgeInsets.only(top: 90),
      child: Container(
        width: deviceInfo.screenSize.width * 0.25,
        height: deviceInfo.screenSize.height * 0.65,
        decoration: const BoxDecoration(
          color: orange,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuList(DeviceInfo deviceInfo) {
    return Positioned(
      left: 50,
      top: 140,
      child: SizedBox(
        width: deviceInfo.screenSize.width * 0.8,
        height: 800,
        child: ListView.builder(
          itemCount: MenuItems.menuItems.length,
          itemBuilder: (context, index) => _buildMenuCard(deviceInfo, index),
        ),
      ),
    );
  }

  Widget _buildMenuCard(DeviceInfo deviceInfo, int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: SizedBox(
          width: deviceInfo.localWidgetSize.width * 0.8,
          height: 87,
          child: Material(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            elevation: 5,
            child: Row(
              children: [
                _buildTypeImage(index),
                _buildTypeName(deviceInfo, index),
                _buildArrowButton(deviceInfo, index),
              ],
            ),
          )),
    );
  }

  Widget _buildTypeImage(int index) {
    return Transform.translate(
      offset: const Offset(-30, 0),
      child: Image.asset(
        MenuItems.menuItems[index].image,
        fit: BoxFit.fill,
      ),
    );
  }

  SizedBox _buildTypeName(DeviceInfo deviceInfo, int index) {
    return SizedBox(
      width: deviceInfo.localWidgetSize.width * 0.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            MenuItems.menuItems[index].name,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          smallText(text: MenuItems.menuItems[index].itemCount)
        ],
      ),
    );
  }

  Widget _buildArrowButton(DeviceInfo deviceInfo, int index) {
    return Transform.translate(
      offset: Offset(deviceInfo.localWidgetSize.width * 0.225, 0),
      child: Material(
        borderRadius: BorderRadius.circular(25),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: IconButton(
              icon: const Icon(Icons.arrow_forward_ios_rounded, color: orange),
              onPressed: MenuItems.menuItems[index].page),
        ),
      ),
    );
  }
}

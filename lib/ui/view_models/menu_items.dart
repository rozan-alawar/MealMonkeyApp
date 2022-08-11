import 'package:flutter/foundation.dart';
import '../../component/constants.dart';
import '../../locator.dart';
import '../../services/navigation_service.dart';

class MenuItems {
  final String name;
  final String image;
  final String itemCount;
  final VoidCallback page;

  MenuItems(
      {required this.name,
      required this.image,
      required this.itemCount,
      required this.page});

  static List<MenuItems> menuItems = [
    MenuItems(
      name: 'Food',
      image: 'assets/images/food/food.png',
      itemCount: '120 items',
      page: () =>
          locator<NavigationService>().navigateTo(routeName: dessertsRoute),
    ),
    MenuItems(
      name: 'Beverages',
      image: 'assets/images/beverages/Beverages.png',
      itemCount: '220 items',
      page: () =>
          locator<NavigationService>().navigateTo(routeName: dessertsRoute),
    ),
    MenuItems(
      name: 'Desserts',
      image: 'assets/images/desserts/Desserts.png',
      itemCount: '155 items',
      page: () =>
          locator<NavigationService>().navigateTo(routeName: dessertsRoute),
    ),
    MenuItems(
      name: 'Promotions',
      image: 'assets/images/promotions/Promotions.png',
      itemCount: '25 items',
      page: () =>
          locator<NavigationService>().navigateTo(routeName: dessertsRoute),
    )
  ];
}

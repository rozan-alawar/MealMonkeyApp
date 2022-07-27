import 'package:meal_monkey/constants/constants.dart';
import 'package:meal_monkey/locator.dart';
import 'package:meal_monkey/models/navigation_service.dart';
import 'package:meal_monkey/views/start/getting_started_screen.dart';

class MenuItems {
  final String name;
  final String image;
  final String itemCount;
  final page;

  MenuItems(
      {required this.name,
      required this.image,
      required this.itemCount,
      required this.page});

  static List<MenuItems> menuItems = [
    MenuItems(
      name: 'Food',
      image: 'assets/images/food.png',
      itemCount: '120 items',
      page: () {
        locator<NavigationService>().navigateTo(dessertsRoute);
      },
    ),
    MenuItems(
      name: 'Beverages',
      image: 'assets/images/Beverages.png',
      itemCount: '220 items',
      page: () {
        locator<NavigationService>().navigateTo(dessertsRoute);
      },
    ),
    MenuItems(
      name: 'Desserts',
      image: 'assets/images/Desserts.png',
      itemCount: '155 items',
      page: () {
        locator<NavigationService>().navigateTo(dessertsRoute);
      },
    ),
    MenuItems(
      name: 'Promotions',
      image: 'assets/images/Promotions.png',
      itemCount: '25 items',
      page: () {
        locator<NavigationService>().navigateTo(dessertsRoute);
      },
    )
  ];
}

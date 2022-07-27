import 'package:flutter/cupertino.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  Future<dynamic> navigateReplacmentTo(String routeName) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  backWith(dynamic data) {
    navigatorKey.currentState!.pop(data);
  }

  back() {
    navigatorKey.currentState!.pop();
  }
}

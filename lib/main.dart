import 'package:flutter/material.dart';
import 'package:meal_monkey/constants/constants.dart';
import 'package:meal_monkey/locator.dart';
import 'package:meal_monkey/models/navigation_service.dart';
import 'package:meal_monkey/models/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  setupLocator();
  runApp(const DeliveryApp());
}

class DeliveryApp extends StatelessWidget {
  const DeliveryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => Routerr.generateRoute(settings),
      initialRoute: splashRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}

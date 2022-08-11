import 'dart:async';
import 'package:flutter/material.dart';
import '../../../component/constants.dart';
import '../../../locator.dart';
import '../../../services/navigation_service.dart';

class SplashScreen extends StatefulWidget {
  static String id = '/splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 3),
        () => locator<NavigationService>()
            .navigateReplacmentTo(routeName: startPageRoute));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Image.asset(
          "assets/images/splash.png",
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}

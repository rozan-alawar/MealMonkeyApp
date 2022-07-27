import 'dart:async';
import 'package:flutter/material.dart';
import 'package:meal_monkey/constants/constants.dart';
import 'package:meal_monkey/responsive/base_widget.dart';

class SplashScreen extends StatefulWidget {
  static String id = '/splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, startPageRoute));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      builder: (context, deviceInfo) => Scaffold(
        body: SizedBox(
          width: deviceInfo.screenSize.width,
          height: deviceInfo.screenSize.height,
          child: Image.asset("assets/images/splash.png", fit: BoxFit.cover),
        ),
      ),
    );
  }
}

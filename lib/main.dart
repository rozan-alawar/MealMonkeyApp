import 'package:flutter/material.dart';
import 'package:meal_monkey/views/OTP_Screen.dart';
import 'package:meal_monkey/views/home_screen.dart';
import 'package:meal_monkey/views/reset_password_screen.dart';
import 'package:meal_monkey/views/getting_started_screen.dart';
import 'package:meal_monkey/views/login_screen.dart';
import 'package:meal_monkey/views/new_password_screen.dart';
import 'package:meal_monkey/views/onbording_screen.dart';
import 'package:meal_monkey/views/sign_up_screen.dart';
import 'package:meal_monkey/views/splach_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(const DeliveryApp());
}

class DeliveryApp extends StatelessWidget {
  const DeliveryApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        GettingStartedScreen.id: (context) => const GettingStartedScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        SignUp.id: (context) => SignUp(),
        ResetPassword.id: (context) => ResetPassword(),
        OTPScreen.id: (context) => const OTPScreen(),
        NewPassword.id: (context) => NewPassword(),
        OnbordingScreen.id: (context) => OnbordingScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
      },
      initialRoute: SplashScreen.id,
    );
  }
}

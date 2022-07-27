import 'package:flutter/material.dart';
import 'package:meal_monkey/constants/constants.dart';
import 'package:meal_monkey/views/auth/login_screen.dart';
import 'package:meal_monkey/views/auth/new_password_screen.dart';
import 'package:meal_monkey/views/auth/otp_screen.dart';
import 'package:meal_monkey/views/auth/reset_password_screen.dart';
import 'package:meal_monkey/views/auth/sign_up_screen.dart';
import 'package:meal_monkey/views/main/main_screen.dart';
import 'package:meal_monkey/views/main/menu/desserts.dart';
import 'package:meal_monkey/views/start/getting_started_screen.dart';
import 'package:meal_monkey/views/start/onbording_screen.dart';
import 'package:meal_monkey/views/start/splash_screen.dart';

class Routerr {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUp());
      case startPageRoute:
        return MaterialPageRoute(builder: (_) => const GettingStartedScreen());
      case bordingRoute:
        return MaterialPageRoute(builder: (_) => OnbordingScreen());
      case resetPassRoute:
        return MaterialPageRoute(builder: (_) => const ResetPassword());
      case otpRoute:
        return MaterialPageRoute(builder: (_) => const OTPScreen());
      case newPassRoute:
        return MaterialPageRoute(builder: (_) => const NewPassword());
      case mainpageRoute:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case dessertsRoute:
        return MaterialPageRoute(builder: (_) => const Desserts());
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}

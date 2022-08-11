import 'package:flutter/material.dart';
import 'package:meal_monkey/component/constants.dart';
import '../ui/view_models/desserts.dart';
import '../ui/views/auth/login_screen.dart';
import '../ui/views/auth/new_password_screen.dart';
import '../ui/views/auth/otp_screen.dart';
import '../ui/views/auth/reset_password_screen.dart';
import '../ui/views/auth/sign_up_screen.dart';
import '../ui/views/main/main_screen.dart';
import '../ui/views/main/menu/desserts_screen.dart';
import '../ui/views/main/menu/product_details.dart';
import '../ui/views/main/more/about_us_screen.dart';
import '../ui/views/main/more/change_address.dart';
import '../ui/views/main/more/checkout_screen.dart';
import '../ui/views/main/more/inbox_screen.dart';
import '../ui/views/main/more/my_order.dart';
import '../ui/views/main/more/notifications_screen.dart';
import '../ui/views/main/more/payment_details_screen.dart';
import '../ui/views/start/getting_started_screen.dart';
import '../ui/views/start/onbording_screen.dart';
import '../ui/views/start/splash_screen.dart';

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
        return MaterialPageRoute(builder: (_) => const OnbordingScreen());
      case resetPassRoute:
        return MaterialPageRoute(builder: (_) => const ResetPassword());
      case otpRoute:
        return MaterialPageRoute(builder: (_) => const OTPScreen());
      case newPassRoute:
        return MaterialPageRoute(builder: (_) => const NewPassword());
      case mainpageRoute:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case dessertsRoute:
        return MaterialPageRoute(builder: (_) => const DessertsScreen());
      case productRoute:
        var argument = settings.arguments as Dessert;
        return MaterialPageRoute(
            builder: (_) => ProductDetails(dessert: argument));
      case paymentDetailsRoute:
        return MaterialPageRoute(builder: (_) => PaymentDetails());
      case notificationsRoute:
        return MaterialPageRoute(builder: (_) => const Notifications());
      case aboutUSRoute:
        return MaterialPageRoute(builder: (_) => const AboutUs());
      case inboxRoute:
        return MaterialPageRoute(builder: (_) => const InboxScreen());
      case myOrderRoute:
        return MaterialPageRoute(builder: (_) => const MyOrder());
      case checkoutRoute:
        return MaterialPageRoute(builder: (_) => const CheckoutScreen());
      case locationRout:
        return MaterialPageRoute(builder: (_) => ChangAddress());
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}

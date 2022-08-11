import 'package:flutter/material.dart';

// all the color constants used within the app

const Color orange = Color(0xffFC6011);
const Color grey = Color(0xffb6b7b7);
const Color white = Colors.white;
const Color red = Color(0xffDD4B39);
const Color blue = Color(0xff367FC0);
const Color secGrey = Color(0xff7c7d7e);
const Color primGrey = Color(0xff4a4b4d);
const Color cardBackground = Color(0xffF4F4F4);
// all the routing constants used within the app
const String splashRoute = '/splash';
const String loginRoute = '/login';
const String signUpRoute = '/sign-up';
const String startPageRoute = '/start-page';
const String bordingRoute = '/onbording';
const String resetPassRoute = '/reset-password';
const String otpRoute = '/otp-page';
const String newPassRoute = '/new-password';
const String mainpageRoute = '/main-page';
const String dessertsRoute = '/desserts';
const String productRoute = '/product';
const String paymentDetailsRoute = '/payment Details';
const String notificationsRoute = '/notifications';
const String aboutUSRoute = '/about-us';
const String inboxRoute = '/inbox';
const String myOrderRoute = '/my-order';
const String checkoutRoute = '/checkout';
const String locationRout = '/location';

final nameController = TextEditingController();
final emailController = TextEditingController();
final mobileNoController = TextEditingController();
final addressController = TextEditingController();
final passwordController = TextEditingController();
final confPasswordController = TextEditingController();
final otpController = TextEditingController();

emailValidator(String value) {
  if (value.isEmpty) {
    return 'Email is required';
  }

  if (!RegExp(r'[^@]+@[^\.]+\..+').hasMatch(value)) {
    return 'Enter correct Email';
  } else {
    return null;
  }
}

passwordValidator(String value) {
  if (value.isEmpty) {
    return 'password is required';
  }

  final password = passwordController.text;
  if (password.length < 8) {
    return 'password must be more than 8 charachters';
  } else {
    return null;
  }
}

coniformPassValidator(String value) {
  if (value.isEmpty) {
    return 'password is required';
  }

  if (confPasswordController.text != passwordController.text) {
    return 'Passwords do not match';
  } else {
    return null;
  }
}

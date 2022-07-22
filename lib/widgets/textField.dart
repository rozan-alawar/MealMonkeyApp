import 'package:flutter/material.dart';
import 'package:meal_monkey/responsive/device_info.dart';

Widget MyTextField(
    {required DeviceInfo deviceInfo,
    required String hintText,
    required controller,
    required validator,
    bool obscure = false,
    TextInputType textInputType = TextInputType.emailAddress}) {
  return SizedBox(
    width: deviceInfo.screenSize.width * 0.85,
    child: TextFormField(
      obscureText: obscure,
      keyboardType: textInputType,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        fillColor: const Color.fromARGB(255, 234, 234, 234),
        filled: true,
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 15, color: Colors.grey),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

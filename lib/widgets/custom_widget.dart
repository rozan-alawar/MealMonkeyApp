import 'package:flutter/material.dart';
import 'package:meal_monkey/constants/constants.dart';
import 'package:meal_monkey/responsive/device_info.dart';

Widget buildHeaderText({required String title, required String description}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 40.0),
    child: Column(
      children: [
        Text(
          textAlign: TextAlign.center,
          title,
          style: const TextStyle(fontSize: 28),
        ),
        smallText(text: description),
      ],
    ),
  );
}

Widget smallText({required String text}) {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: Text(
      text,
      style: const TextStyle(
          fontSize: 15,
          color: Color.fromARGB(255, 168, 169, 170),
          fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    ),
  );
}

Widget buildTextOption(
    BuildContext context, routeId, String optionDetails, String option) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        smallText(text: optionDetails),
        GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(routeId),
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              option,
              style: const TextStyle(
                  color: Main_Color, fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget txtMessage(String message, bool visible) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Visibility(
      visible: visible,
      child: Text(
        textAlign: TextAlign.center,
        message,
        style: const TextStyle(
            fontSize: 14, color: Colors.red, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget MyButton(
    {required onPressed,
    required Widget widget,
    required Color color,
    required DeviceInfo deviceInfo}) {
  return SizedBox(
    width: deviceInfo.screenSize.width * 0.85,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: color,
          onPrimary: color == Main_Color ? Colors.white : Main_Color,
          padding: const EdgeInsets.symmetric(vertical: 20),
          textStyle: const TextStyle(fontSize: 17),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(
                  color: color == Colors.white ? Main_Color : color))),
      onPressed: onPressed,
      child: widget,
    ),
  );
}

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

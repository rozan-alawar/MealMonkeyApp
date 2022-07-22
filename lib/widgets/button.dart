import 'package:flutter/material.dart';
import 'package:meal_monkey/responsive/device_info.dart';

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
          onPrimary: color == const Color(0xffFC6011)
              ? Colors.white
              : const Color(0xffFC6011),
          padding: const EdgeInsets.symmetric(vertical: 20),
          textStyle: const TextStyle(fontSize: 17),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(
                  color: color == Colors.white
                      ? const Color(0xffFC6011)
                      : color))),
      onPressed: onPressed,
      child: widget,
    ),
  );
}

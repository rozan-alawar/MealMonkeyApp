import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../component/constants.dart';

class Button extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;
  final Widget widget;
  final double width;
  final double height;

  const Button(
      {Key? key,
      required this.onPressed,
      required this.widget,
      required this.color,
      this.width = 333,
      this.height = 56})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: Size(width.w, height.h),
          primary: color,
          onPrimary: color == orange ? white : orange,
          textStyle: const TextStyle(fontSize: 17),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(color: color == white ? orange : color))),
      onPressed: onPressed,
      child: widget,
    );
  }
}

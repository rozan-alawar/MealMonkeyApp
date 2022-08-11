import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../component/constants.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final bool obscure;
  final TextInputType textInputType;
  final bool withPrefixIcon;

  const MyTextField(
      {Key? key,
      required this.hintText,
      required this.controller,
      required this.validator,
      this.obscure = false,
      this.textInputType = TextInputType.emailAddress,
      this.withPrefixIcon = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 333.w,
      height: 85.h,
      child: TextFormField(
        obscureText: obscure,
        keyboardType: textInputType,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          filled: true,
          prefixIcon: withPrefixIcon ? const Icon(Icons.search) : null,
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 15, color: grey),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 30.h, vertical: 20.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../component/constants.dart';

class MyAppBar extends StatelessWidget {
  final String title;
  final bool haveLeading;
  final bool haveTrailing;

  const MyAppBar({
    Key? key,
    required this.title,
    this.haveLeading = false,
    this.haveTrailing = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 20,
      leading: haveLeading
          ? IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 20,
              ))
          : null,
      iconTheme: const IconThemeData(color: primGrey),
      backgroundColor: white,
      elevation: 0,
      title: Text(
        title,
        style: TextStyle(color: Colors.black, fontSize: 20.sp),
      ),
      actions: haveTrailing
          ? [
              const Icon(
                Icons.shopping_cart_rounded,
                size: 30,
              ),
              const SizedBox(width: 20),
            ]
          : [],
    );
  }
}

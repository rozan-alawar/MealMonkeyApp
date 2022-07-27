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
    padding: const EdgeInsets.only(top: 10.0),
    child: Text(
      text,
      style: const TextStyle(
          fontSize: 15, color: grey, fontWeight: FontWeight.bold),
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
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              option,
              style: const TextStyle(
                  color: orange, fontWeight: FontWeight.bold, fontSize: 16),
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
    width: deviceInfo.screenSize.width * 0.9,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: color,
          onPrimary: color == orange ? white : orange,
          padding: const EdgeInsets.symmetric(vertical: 20),
          textStyle: const TextStyle(fontSize: 17),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(color: color == white ? orange : color))),
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
    TextInputType textInputType = TextInputType.emailAddress,
    bool withPrefixIcon = false}) {
  return SizedBox(
    width: deviceInfo.screenSize.width * 0.9,
    child: TextFormField(
      obscureText: obscure,
      keyboardType: textInputType,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: withPrefixIcon ? const Icon(Icons.search) : null,
        // fillColor: grey,
        filled: true,
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 15, color: grey),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

AppBar myAppBar(
    {required String text, bool automaticallyImplyLeading = false}) {
  return AppBar(
    titleSpacing: 20,
    automaticallyImplyLeading: automaticallyImplyLeading,
    iconTheme: const IconThemeData(color: primGrey),
    backgroundColor: white,
    elevation: 0,
    title: Text(
      text,
      style: const TextStyle(color: Colors.black, fontSize: 22),
    ),
    actions: const [
      Icon(
        Icons.shopping_cart_rounded,
        size: 30,
      ),
      SizedBox(width: 20)
    ],
  );
}

Widget buildSearchFoodBox(
    DeviceInfo deviceInfo, TextEditingController searchController) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: MyTextField(
        deviceInfo: deviceInfo,
        hintText: 'Search food',
        controller: searchController,
        validator: (value) {},
        withPrefixIcon: true),
  );
}

import 'package:flutter/material.dart';

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
                  color: Color(0xffFC6011),
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
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

import 'package:flutter/material.dart';
import 'sub_text.dart';

class Header extends StatelessWidget {
  final String title;
  final String description;
  const Header({Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Column(
        children: [
          Text(
            textAlign: TextAlign.center,
            title,
            style: const TextStyle(fontSize: 28),
          ),
          SmallText(text: description),
        ],
      ),
    );
  }
}

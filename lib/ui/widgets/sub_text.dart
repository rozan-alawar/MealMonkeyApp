import 'package:flutter/material.dart';
import '../../component/constants.dart';

class SmallText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  const SmallText(
      {Key? key, required this.text, this.textAlign = TextAlign.center})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 15, color: grey, fontWeight: FontWeight.bold),
        textAlign: textAlign,
      ),
    );
  }
}

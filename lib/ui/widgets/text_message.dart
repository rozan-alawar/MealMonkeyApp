import 'package:flutter/material.dart';

class TextMessage extends StatelessWidget {
  final bool visible;
  final String message;
  const TextMessage({Key? key, required this.message, this.visible = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Text(
        textAlign: TextAlign.center,
        message,
        style: const TextStyle(
            fontSize: 14, color: Colors.red, fontWeight: FontWeight.w500),
      ),
    );
  }
}

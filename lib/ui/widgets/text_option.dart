import 'package:flutter/material.dart';
import '../../component/constants.dart';

import '../../locator.dart';
import '../../services/navigation_service.dart';
import 'sub_text.dart';

class OptionText extends StatelessWidget {
  final String routName;
  final String optionDetails;
  final String optionText;
  const OptionText(
      {Key? key,
      required this.routName,
      required this.optionDetails,
      required this.optionText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SmallText(text: optionDetails),
          TextButton(
            onPressed: () => locator<NavigationService>()
                .navigateReplacmentTo(routeName: routName),
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                optionText,
                style: const TextStyle(
                    color: orange, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}

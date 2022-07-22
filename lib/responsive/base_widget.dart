import 'package:flutter/cupertino.dart';
import 'package:meal_monkey/responsive/device_info.dart';

class BaseWidget extends StatelessWidget {
  final Widget Function(BuildContext context, DeviceInfo deviceInfo) builder;
  const BaseWidget({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        var deviceInfo = DeviceInfo(
            screenSize: mediaQueryData.size,
            localWidgetSize: Size(constraints.maxWidth, constraints.maxWidth));
        return builder(context, deviceInfo);
      },
    );
  }
}

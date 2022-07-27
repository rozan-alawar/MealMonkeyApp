import 'package:flutter/material.dart';
import 'package:meal_monkey/responsive/base_widget.dart';
import 'package:meal_monkey/responsive/device_info.dart';
import 'package:meal_monkey/views/start/onbording_screen.dart';
import 'package:meal_monkey/widgets/custom_widget.dart';
import 'package:meal_monkey/constants/constants.dart';

class GettingStartedScreen extends StatefulWidget {
  const GettingStartedScreen({Key? key}) : super(key: key);

  @override
  State<GettingStartedScreen> createState() => _GettingStartedScreenState();
}

class _GettingStartedScreenState extends State<GettingStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      builder: (context, deviceInfo) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildPageHeader(deviceInfo),
              _buildAboutText(deviceInfo),
              _buildControlButton(deviceInfo),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageHeader(DeviceInfo deviceInfo) {
    return Transform.translate(
      offset: const Offset(0, -50),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/orange_bg.png",
              width: deviceInfo.screenSize.width,
              height: deviceInfo.screenSize.height * 0.6,
              fit: BoxFit.cover,
            ),
            Transform.translate(
                offset: const Offset(0, -120),
                child: Image.asset(
                  "assets/images/logo.png",
                  height: deviceInfo.screenSize.height * 0.18,
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutText(DeviceInfo deviceInfo) {
    return Transform.translate(
      offset: const Offset(0, -100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            "Discover the best foods from over 1,000",
            style: TextStyle(
              color: grey,
            ),
          ),
          Text(
            "restaurants and fast delivery to your doorstep",
            style: TextStyle(
              color: grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton(DeviceInfo deviceInfo) {
    return Transform.translate(
      offset: const Offset(0, -50),
      child: Column(
        children: [
          MyButton(
            onPressed: () {
              Navigator.of(context).pushNamed(loginRoute);
            },
            widget: const Text('Login'),
            color: orange,
            deviceInfo: deviceInfo,
          ),
          const SizedBox(height: 20),
          MyButton(
            onPressed: () {
              Navigator.of(context).pushNamed(OnbordingScreen.id);
            },
            widget: const Text('Create an account'),
            color: white,
            deviceInfo: deviceInfo,
          ),
        ],
      ),
    );
  }
}

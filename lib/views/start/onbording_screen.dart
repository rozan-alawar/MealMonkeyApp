import 'package:flutter/material.dart';
import 'package:meal_monkey/models/onbording_content.dart';
import 'package:meal_monkey/responsive/base_widget.dart';
import 'package:meal_monkey/responsive/device_info.dart';
import 'package:meal_monkey/widgets/custom_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constants/constants.dart';

class OnbordingScreen extends StatefulWidget {
  static String id = '/onbording-screen';

  OnbordingScreen({Key? key}) : super(key: key);

  final List<OnbordingContent> content = [
    OnbordingContent(
      image: "assets/images/Find food you love vector.png",
      title: "Find Food You Love",
      description:
          'Discover the best foods from over 1,000 \nrestaurants and fast delivery to your doorstep',
    ),
    OnbordingContent(
      image: "assets/images/Delivery vector.png",
      title: "Fast Delivery",
      description: 'Fast food delivery to your home, office \nwherever you are',
    ),
    OnbordingContent(
      image: "assets/images/Live tracking vector.png",
      title: "Live Tracking",
      description:
          'Real time tracking of your food on the app \nonce you placed the order',
    ),
  ];

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  late PageController controller;

  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      builder: (context, deviceInfo) => SafeArea(
          child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: deviceInfo.screenSize.width,
              height: deviceInfo.screenSize.height * 0.65,
              child: PageView.builder(
                controller: controller,
                itemCount: widget.content.length,
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(widget.content[index].image),
                    const SizedBox(height: 20),
                    const SizedBox(height: 10),
                    _buildInformation(index),
                  ],
                ),
              ),
            ),
            _buildSliderIndicators(),
            _buildControlButton(context, deviceInfo),
          ],
        ),
      )),
    );
  }

  Widget _buildSliderIndicators() {
    return Transform.translate(
      offset: const Offset(0, -200),
      child: SmoothPageIndicator(
        controller: controller,
        count: widget.content.length,
        effect: const SwapEffect(
            activeDotColor: orange,
            dotColor: grey,
            dotHeight: 10,
            dotWidth: 10),
      ),
    );
  }

  Widget _buildInformation(int index) {
    return buildHeaderText(
        title: widget.content[index].title,
        description: widget.content[index].description);
  }

  Widget _buildControlButton(BuildContext context, DeviceInfo deviceInfo) {
    return MyButton(
      onPressed: () {
        controller.page! < 2
            ? controller.nextPage(
                duration: Duration(seconds: 1), curve: Curves.ease)
            : Navigator.of(context).pushReplacementNamed(signUpRoute);
      },
      widget: Text('Next'),
      color: orange,
      deviceInfo: deviceInfo,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

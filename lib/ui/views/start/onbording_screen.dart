import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/ui/view_models/onbording_content.dart';
import 'package:meal_monkey/ui/widgets/button.dart';
import 'package:meal_monkey/ui/widgets/header.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../../component/constants.dart';
import '../../../../../../locator.dart';
import '../../../../../../services/navigation_service.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({Key? key}) : super(key: key);

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
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: 820.h,
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                width: double.infinity,
                height: 600.h,
                child: PageView.builder(
                  controller: controller,
                  itemCount: OnbordingContent.content.length,
                  itemBuilder: (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(OnbordingContent.content[index].image,
                          height: 320.h, width: 250.w, fit: BoxFit.fill),
                      SizedBox(height: 40.h),
                      _buildInformation(index),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                top: 450.h,
                left: 170.w,
                right: 155.w,
                child: _buildSliderIndicators()),
            Positioned(
                bottom: 100.h,
                left: 50.w,
                right: 50.w,
                child: _buildControlButton()),
          ],
        ),
      ),
    ));
  }

  Widget _buildSliderIndicators() {
    return SmoothPageIndicator(
      controller: controller,
      count: OnbordingContent.content.length,
      effect: const SwapEffect(
          activeDotColor: orange, dotColor: grey, dotHeight: 10, dotWidth: 10),
    );
  }

  Widget _buildInformation(int index) {
    return Header(
        title: OnbordingContent.content[index].title,
        description: OnbordingContent.content[index].description);
  }

  Widget _buildControlButton() {
    return Button(
      onPressed: () {
        controller.page! < 2
            ? controller.nextPage(
                duration: const Duration(seconds: 1), curve: Curves.ease)
            : locator<NavigationService>()
                .navigateReplacmentTo(routeName: signUpRoute);
      },
      widget: const Text('Next'),
      color: orange,
    );
  }
}

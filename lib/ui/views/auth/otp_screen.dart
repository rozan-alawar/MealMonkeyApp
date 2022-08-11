import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import '../../../component/constants.dart';
import '../../../locator.dart';
import '../../../services/navigation_service.dart';
import '../../widgets/button.dart';
import '../../widgets/header.dart';
import '../../widgets/text_message.dart';
import '../../widgets/text_option.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  bool visible = false;
  String _message = '';
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Header(
                title: "We have sent an OTP to\nyour Mobile",
                description:
                    "Please check your mobile number 071*****12\ncontinue to reset your password",
              ),
              textInput(),
              TextMessage(message: _message, visible: visible),
              SizedBox(height: 20.h),
              _buildLoginButton(),
              const OptionText(
                routName: newPassRoute,
                optionDetails: "Didn't Receive? ",
                optionText: "Click Here",
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget textInput() {
    return Pinput(
      autofocus: true,
      keyboardType: TextInputType.number,
      inputFormatters: [LengthLimitingTextInputFormatter(4)],
      length: 4,
      controller: otpController,
      textInputAction: TextInputAction.next,
    );
  }

  Widget _buildLoginButton() {
    return Button(
      onPressed: () {
        otpController.text == '0000'
            ? locator<NavigationService>()
                .navigateReplacmentTo(routeName: newPassRoute)
            : setState(() {
                visible = true;
                _message = 'Invalid number';
              });
      },
      widget: const Text('Next'),
      color: orange,
    );
  }
}

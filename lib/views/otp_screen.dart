import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meal_monkey/constants/constants.dart';
import 'package:meal_monkey/responsive/base_widget.dart';
import 'package:meal_monkey/responsive/device_info.dart';
import 'package:meal_monkey/views/new_password_screen.dart';
import 'package:meal_monkey/widgets/custom_widget.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatefulWidget {
  static String id = '/OTP-screen';

  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  bool visible = false;
  String _message = '';

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      builder: (context, deviceInfo) => SafeArea(
          child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildHeaderText(
                  title: "We have sent an OTP to\nyour Mobile",
                  description:
                      "Please check your mobile number 071*****12\ncontinue to reset your password",
                ),
                textInput(),
                txtMessage(_message, visible),
                _buildLoginButton(context, deviceInfo),
                buildTextOption(
                    context, NewPassword.id, "Didn't Receive? ", "Click Here")
              ],
            ),
          ),
        ),
      )),
    );
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

  Widget _buildLoginButton(BuildContext context, DeviceInfo deviceInfo) {
    return MyButton(
      onPressed: () {
        otpController.text == '0000'
            ? Navigator.of(context).pushReplacementNamed(NewPassword.id)
            : setState(() {
                visible = true;
                _message = 'Invalid number';
              });
        ;
      },
      widget: const Text('Next'),
      color: Main_Color,
      deviceInfo: deviceInfo,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meal_monkey/responsive/base_widget.dart';
import 'package:meal_monkey/responsive/device_info.dart';
import 'package:meal_monkey/views/OTP_Screen.dart';
import 'package:meal_monkey/widgets/button.dart';
import 'package:meal_monkey/widgets/custom_widget.dart';
import 'package:meal_monkey/widgets/textField.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResetPassword extends StatefulWidget {
  static String id = '/reset-password-screen';

  ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool visible = false;
  String _message = '';

  final _key = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      builder: (context, deviceInfo) => SafeArea(
          child: Scaffold(
        body: Form(
          key: _key,
          child: SizedBox(
            width: deviceInfo.screenSize.width,
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    buildHeaderText(
                      title: "Reset Password",
                      description:
                          "Please enter your email to receive a\nlink to  create a new password via email",
                    ),
                    _buildUserInput(deviceInfo),
                    txtMessage(_message, visible),
                    _buildLoginButton(context, deviceInfo),
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  Widget _buildUserInput(DeviceInfo deviceInfo) {
    return MyTextField(
      deviceInfo: deviceInfo,
      hintText: 'Email',
      controller: _emailController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Email is required';
        }

        if (!RegExp(r'[^@]+@[^\.]+\..+').hasMatch(value)) {
          return 'Enter correct Email';
        } else {
          return null;
        }
      },
    );
  }

  Widget _buildLoginButton(BuildContext context, DeviceInfo deviceInfo) {
    return MyButton(
      onPressed: () async {
        final form = _key.currentState;
        if (!form!.validate()) {
          return;
        }

        SharedPreferences preferences = await SharedPreferences.getInstance();
        final email = preferences.get('email');

        if (email == _emailController.text) {
          Navigator.of(context).pushReplacementNamed(OTPScreen.id);
        } else {
          setState(() {
            _message = 'email is incorrect';
            visible = true;
          });
        }
      },
      widget: const Text('Send'),
      color: const Color(0xffFC6011),
      deviceInfo: deviceInfo,
    );
  }
}

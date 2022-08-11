import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/header.dart';
import '../../widgets/text_field.dart';
import '../../widgets/text_message.dart';
import '../../../component/constants.dart';
import '../../../locator.dart';
import '../../../services/navigation_service.dart';
import '../../widgets/button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);
  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool visible = false;
  String _message = '';
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: key,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Header(
                  title: "Reset Password",
                  description:
                      "Please enter your email to receive a\nlink to  create a new password via email",
                ),
                _buildUserInput(),
                TextMessage(message: _message, visible: visible),
                SizedBox(height: 5.h),
                _buildLoginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserInput() {
    return MyTextField(
      hintText: 'Email',
      controller: emailController,
      validator: (value) => emailValidator(value!),
    );
  }

  Widget _buildLoginButton() {
    return Button(
      onPressed: () async {
        final form = key.currentState;
        if (!form!.validate()) {
          return;
        }

        SharedPreferences preferences = await SharedPreferences.getInstance();
        final email = preferences.get('email');

        if (email == emailController.text) {
          locator<NavigationService>()
              .navigateReplacmentTo(routeName: otpRoute);
          emailController.clear();
        } else {
          setState(() {
            _message = 'Email is incorrect';
            visible = true;
          });
        }
      },
      widget: const Text('Send'),
      color: orange,
    );
  }
}

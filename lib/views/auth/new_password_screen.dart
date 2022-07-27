import 'package:flutter/material.dart';
import 'package:meal_monkey/constants/constants.dart';
import 'package:meal_monkey/responsive/base_widget.dart';
import 'package:meal_monkey/responsive/device_info.dart';
import 'package:meal_monkey/widgets/custom_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      builder: (context, deviceInfo) => SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: key,
              child: Center(
                child: Column(
                  children: [
                    buildHeaderText(
                        title: "New Password",
                        description:
                            "Please enter your email to receive a \nlink to  create a new password via email"),
                    _buildUserInput(deviceInfo),
                    const SizedBox(height: 20),
                    _buildLoginButton(context, deviceInfo),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserInput(DeviceInfo deviceInfo) {
    return Column(
      children: [
        MyTextField(
            deviceInfo: deviceInfo,
            hintText: 'Password',
            controller: passwordController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'password is required';
              }

              final password = passwordController.text;
              if (password.length < 8) {
                return 'password must be more than 8 charachters';
              }
            },
            obscure: true),
        const SizedBox(height: 20),
        MyTextField(
            deviceInfo: deviceInfo,
            hintText: 'Coniform Password',
            controller: confPasswordController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'password is required';
              }

              if (confPasswordController.text != passwordController.text) {
                return 'Passwords do not match';
              }
            },
            obscure: true),
      ],
    );
  }

  Future<void> _validate() async {
    final form = key.currentState;
    if (!form!.validate()) {
      return;
    }

    SharedPreferences preferences = await SharedPreferences.getInstance();
    // final password = preferences.get('password');
    preferences.setString('password', passwordController.text.trim());

    Navigator.of(context).pushReplacementNamed(loginRoute);

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('password change successful')));
  }

  Widget _buildLoginButton(BuildContext context, DeviceInfo deviceInfo) {
    return MyButton(
      onPressed: _validate,
      widget: const Text('Next'),
      color: orange,
      deviceInfo: deviceInfo,
    );
  }

  @override
  void dispose() {
    passwordController.clear();
    confPasswordController.clear();
    super.dispose();
  }
}

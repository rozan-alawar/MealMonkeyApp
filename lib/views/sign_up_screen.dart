import 'package:flutter/material.dart';
import 'package:meal_monkey/constants/constants.dart';
import 'package:meal_monkey/responsive/base_widget.dart';
import 'package:meal_monkey/responsive/device_info.dart';
import 'package:meal_monkey/views/login_screen.dart';
import 'package:meal_monkey/widgets/custom_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  static String id = '/sign-up-screen';

  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      builder: (context, deviceInfo) => SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: key,
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildHeaderText(
                        title: "Sign Up",
                        description: "Add your details to sign up",
                      ),
                      _buildUserInput(deviceInfo),
                      const SizedBox(height: 20),
                      _buildLoginButton(context, deviceInfo),
                      buildTextOption(context, LoginScreen.id,
                          "Don't have an Account? ", "Login")
                    ],
                  ),
                ],
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
          hintText: 'Name',
          controller: nameController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Name is required';
            }
          },
        ),
        const SizedBox(height: 20),
        MyTextField(
          deviceInfo: deviceInfo,
          hintText: 'Email',
          controller: emailController,
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
        ),
        const SizedBox(height: 20),
        MyTextField(
          deviceInfo: deviceInfo,
          hintText: 'Mobile No',
          controller: mobileNoController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Mobile Number is required';
            }
          },
        ),
        const SizedBox(height: 20),
        MyTextField(
          deviceInfo: deviceInfo,
          hintText: 'Address',
          controller: addressController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Address is required';
            }
          },
        ),
        const SizedBox(height: 20),
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
          obscure: true,
        ),
        const SizedBox(height: 20),
        MyTextField(
          deviceInfo: deviceInfo,
          hintText: 'Coniform Password',
          controller: confPasswordController,
          obscure: true,
          validator: (value) {
            if (value!.isEmpty) {
              return 'password is required';
            }
            if (confPasswordController.text != passwordController.text) {
              return 'Passwords do not match';
            }
          },
        ),
      ],
    );
  }

  Widget _buildLoginButton(BuildContext context, DeviceInfo deviceInfo) {
    return MyButton(
      onPressed: _validate,
      widget: const Text('Sign Up'),
      color: Main_Color,
      deviceInfo: deviceInfo,
    );
  }

  void _validate() async {
    final form = key.currentState;
    if (!form!.validate()) {
      return;
    }

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('name', nameController.text.trim());
    preferences.setString('email', emailController.text.trim());
    preferences.setString('mobile', mobileNoController.text.trim());
    preferences.setString('address', addressController.text.trim());
    preferences.setString('password', passwordController.text.trim());
    preferences.setString('conpassword', confPasswordController.text.trim());

    setState(() {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Sign up'),
          content: const Text('you create account successful!'),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Done'))
          ],
        ),
      );
    });
  }

  @override
  void dispose() {
    emailController.clear();
    nameController.clear();
    mobileNoController.clear();
    addressController.clear();
    passwordController.clear();
    confPasswordController.clear();
    super.dispose();
  }
}

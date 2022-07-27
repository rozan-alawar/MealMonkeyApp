import 'package:flutter/material.dart';
import 'package:meal_monkey/constants/constants.dart';
import 'package:meal_monkey/responsive/base_widget.dart';
import 'package:meal_monkey/responsive/device_info.dart';
import 'package:meal_monkey/views/auth/reset_password_screen.dart';
import 'package:meal_monkey/widgets/custom_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool visible = false;
  String _message = '';
  final key = GlobalKey<FormState>();

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
                  buildHeaderText(
                    title: "Login",
                    description: "Add your details to login",
                  ),
                  _buildUserInput(deviceInfo),
                  txtMessage(_message, visible),
                  _buildLoginButton(context, deviceInfo),
                  GestureDetector(
                      onTap: () =>
                          Navigator.of(context).pushNamed(resetPassRoute),
                      child: smallText(text: "Forgot your password?")),
                  const SizedBox(height: 50),
                  smallText(text: "or Login With"),
                  _buildSocialMediaControls(deviceInfo),
                  const SizedBox(height: 50),
                  buildTextOption(context, signUpRoute,
                      "Don't have an Account? ", ' Sign up'),
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
            hintText: 'Your Email',
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
            }),
        const SizedBox(height: 20),
        MyTextField(
            deviceInfo: deviceInfo,
            hintText: 'password',
            controller: passwordController,
            obscure: true,
            textInputType: TextInputType.visiblePassword,
            validator: (text) {
              if (text!.isEmpty) {
                return 'password is required';
              }

              final password = passwordController.text;
              if (password.length < 8) {
                return 'password must be more than 8 charachters';
              }
            }),
      ],
    );
  }

  Widget _buildLoginButton(BuildContext context, DeviceInfo deviceInfo) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: MyButton(
        onPressed: _validate,
        widget: const Text('Login'),
        color: orange,
        deviceInfo: deviceInfo,
      ),
    );
  }

  Future<void> _validate() async {
    final form = key.currentState;
    if (!form!.validate()) {
      return;
    }

    SharedPreferences preferences = await SharedPreferences.getInstance();
    final email = preferences.get('email');
    final password = preferences.get('password');

    if (email == null) {
      setState(() {
        visible = true;
        _message =
            'The email you entered isn’t connected to an account. sign up now';
      });
    } else {
      if (email as String == emailController.text.trim() &&
          password as String == passwordController.text.trim()) {
        Navigator.of(context).pushReplacementNamed(mainpageRoute,
            arguments: preferences.getString('name'));
      } else {
        setState(() {
          visible = true;
          _message = 'your email or password is incorrect';
        });
      }
    }
  }

  Widget _buildSocialMediaControls(DeviceInfo deviceInfo) {
    return Column(
      children: [
        const SizedBox(height: 20),
        MyButton(
            onPressed: () {},
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/facebook-letter-logo.png"),
                const SizedBox(width: 25),
                const Text(
                  "Login with Facebook",
                  style: TextStyle(color: white, fontSize: 14),
                )
              ],
            ),
            color: blue,
            deviceInfo: deviceInfo),
        const SizedBox(height: 15),
        MyButton(
            onPressed: () {},
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/google-plus-logo.png"),
                const SizedBox(width: 25),
                const Text(
                  "Login with Google",
                  style: TextStyle(color: white, fontSize: 14),
                )
              ],
            ),
            color: red,
            deviceInfo: deviceInfo),
      ],
    );
  }

  @override
  void dispose() {
    passwordController.clear();
    emailController.clear();
    super.dispose();
  }
}

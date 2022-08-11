import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../component/constants.dart';
import '../../../locator.dart';
import '../../../services/navigation_service.dart';
import '../../widgets/button.dart';
import '../../widgets/header.dart';
import '../../widgets/text_field.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: key,
            child: Center(
              child: Column(
                children: [
                  const Header(
                      title: "New Password",
                      description:
                          "Please enter your email to receive a \nlink to  create a new password via email"),
                  _buildpasswordField(),
                  _buildConiformpasswordField(),
                  SizedBox(height: 20.h),
                  _buildLoginButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildpasswordField() {
    return MyTextField(
      hintText: 'password',
      controller: passwordController,
      obscure: true,
      textInputType: TextInputType.visiblePassword,
      validator: (value) => passwordValidator(value!),
    );
  }

  Widget _buildConiformpasswordField() {
    return MyTextField(
      hintText: 'Coniform password',
      controller: confPasswordController,
      obscure: true,
      textInputType: TextInputType.visiblePassword,
      validator: (value) => coniformPassValidator(value!),
    );
  }

  Future<void> _validate() async {
    final form = key.currentState;
    if (!form!.validate()) {
      return;
    }

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('password', passwordController.text.trim());

    locator<NavigationService>().navigateReplacmentTo(routeName: loginRoute);
    passwordController.clear();
    confPasswordController.clear();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('password change successful'),
      backgroundColor: orange,
    ));
  }

  Widget _buildLoginButton() {
    return Button(
      onPressed: _validate,
      widget: const Text('Next'),
      color: orange,
    );
  }
}

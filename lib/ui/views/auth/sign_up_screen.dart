import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../component/constants.dart';
import '../../../locator.dart';
import '../../../services/navigation_service.dart';
import '../../widgets/button.dart';
import '../../widgets/header.dart';
import '../../widgets/text_field.dart';
import '../../widgets/text_option.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: key,
            child: Column(
              children: [
                Header(
                  title: AppLocalizations.of(context)!.signUp,
                  description: AppLocalizations.of(context)!.signupdescription,
                ),
                _buildUserInput(),
                _buildLoginButton(),
                OptionText(
                  routName: loginRoute,
                  optionDetails:
                      AppLocalizations.of(context)!.optionSignUpDesciption,
                  optionText: AppLocalizations.of(context)!.login,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserInput() {
    return Column(
      children: [
        MyTextField(
          hintText: AppLocalizations.of(context)!.name,
          controller: nameController,
          validator: (value) => value!.isEmpty ? 'Name is required' : null,
        ),
        MyTextField(
          hintText: AppLocalizations.of(context)!.yourEmail,
          controller: emailController,
          validator: (value) => emailValidator(value!),
        ),
        MyTextField(
          hintText: AppLocalizations.of(context)!.mobileNo,
          controller: mobileNoController,
          validator: (value) =>
              value!.isEmpty ? 'Mobile Number is required' : null,
        ),
        MyTextField(
          hintText: AppLocalizations.of(context)!.address,
          controller: addressController,
          validator: (value) => value!.isEmpty ? 'Address is required' : null,
        ),
        MyTextField(
          hintText: AppLocalizations.of(context)!.password,
          controller: passwordController,
          validator: (value) => passwordValidator(value!),
          obscure: true,
        ),
        MyTextField(
            hintText: AppLocalizations.of(context)!.confirmPassword,
            controller: confPasswordController,
            obscure: true,
            validator: (value) => coniformPassValidator(value!)),
      ],
    );
  }

  Widget _buildLoginButton() {
    return Button(
      onPressed: _validate,
      widget: Text(AppLocalizations.of(context)!.signUp),
      color: orange,
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

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('you create account successful!'),
      backgroundColor: orange,
      onVisible: () {
        locator<NavigationService>()
            .navigateReplacmentTo(routeName: loginRoute);
        emailController.clear();
        nameController.clear();
        mobileNoController.clear();
        addressController.clear();
        passwordController.clear();
        confPasswordController.clear();
      },
    ));
  }
}

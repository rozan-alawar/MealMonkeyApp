import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../component/constants.dart';
import '../../../locator.dart';
import '../../../services/navigation_service.dart';
import '../../widgets/button.dart';
import '../../widgets/header.dart';
import '../../widgets/sub_text.dart';
import '../../widgets/text_field.dart';
import '../../widgets/text_option.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/text_message.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: key,
            child: Column(
              children: [
                _buildHeader(),
                _buildUserEmailInput(),
                _buildpasswordField(),
                TextMessage(message: _message, visible: visible),
                _buildLoginButton(),
                _buildForgetPasswordBtn(),
                SizedBox(height: 55.h),
                SmallText(text: AppLocalizations.of(context)!.orLoginWith),
                _buildSocialMediaControl(
                    "assets/images/icons/facebook-letter-logo.png",
                    AppLocalizations.of(context)!.loginWithFacebook,
                    blue),
                _buildSocialMediaControl(
                    'assets/images/icons/google-plus-logo.png',
                    AppLocalizations.of(context)!.loginWithGoogle,
                    red),
                SizedBox(height: 40.h),
                OptionText(
                    routName: signUpRoute,
                    optionDetails:
                        AppLocalizations.of(context)!.optionDescription,
                    optionText: AppLocalizations.of(context)!.signUp),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Header(
      title: AppLocalizations.of(context)!.login,
      description: AppLocalizations.of(context)!.addYourDetailsToLogin,
    );
  }

  Widget _buildUserEmailInput() {
    return MyTextField(
        hintText: AppLocalizations.of(context)!.yourEmail,
        controller: emailController,
        validator: (value) => emailValidator(value!));
  }

  Widget _buildpasswordField() {
    return MyTextField(
      hintText: AppLocalizations.of(context)!.password,
      controller: passwordController,
      obscure: true,
      textInputType: TextInputType.visiblePassword,
      validator: (value) => passwordValidator(value!),
    );
  }

  Widget _buildLoginButton() {
    return Button(
      onPressed: _validate,
      widget: Text(AppLocalizations.of(context)!.login),
      color: orange,
    );
  }

  Widget _buildForgetPasswordBtn() {
    return TextButton(
        onPressed: () => locator<NavigationService>()
            .navigateReplacmentTo(routeName: resetPassRoute),
        child: SmallText(text: AppLocalizations.of(context)!.forgetPassword));
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
        _message = AppLocalizations.of(context)!.errorMessage1;
      });
    } else {
      if (email as String == emailController.text.trim() &&
          password as String == passwordController.text.trim()) {
        locator<NavigationService>()
            .navigateReplacmentTo(routeName: mainpageRoute);
        passwordController.clear();
        emailController.clear();
      } else {
        setState(() {
          visible = true;
          _message = AppLocalizations.of(context)!.errorMessage2;
        });
      }
    }
  }

  Widget _buildSocialMediaControl(String logo, String text, Color color) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h),
      child: Button(
        onPressed: () {},
        widget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(logo),
            const SizedBox(width: 25),
            Text(
              text,
              style: const TextStyle(color: white, fontSize: 14),
            )
          ],
        ),
        color: color,
      ),
    );
  }
}

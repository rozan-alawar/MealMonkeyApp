import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../component/constants.dart';
import '../../../locator.dart';
import '../../../services/navigation_service.dart';
import '../../widgets/button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GettingStartedScreen extends StatelessWidget {
  const GettingStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildPageHeader(),
            const SizedBox(height: 10),
            _buildAboutText(context),
            const SizedBox(height: 30),
            _buildControlBtn(
                AppLocalizations.of(context)!.login, orange, login),
            const SizedBox(height: 15),
            _buildControlBtn(AppLocalizations.of(context)!.createAnAccount,
                white, createAccount),
          ],
        ),
      ),
    );
  }

  Widget _buildPageHeader() {
    return Image.asset(
      "assets/images/logo.png",
      width: double.infinity,
      height: 570.h,
      fit: BoxFit.cover,
    );
  }

  Widget _buildAboutText(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.appDescription,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: grey,
      ),
    );
  }

  Widget _buildControlBtn(String text, Color color, onPressed) {
    return Button(
      onPressed: onPressed,
      widget: Text(text),
      color: color,
    );
  }

  void login() {
    locator<NavigationService>().navigateTo(routeName: loginRoute);
  }

  void createAccount() {
    locator<NavigationService>().navigateTo(routeName: bordingRoute);
  }
}

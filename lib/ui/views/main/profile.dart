import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../component/constants.dart';
import '../../widgets/sub_text.dart';
import '../../widgets/text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/app_bar.dart';
import '../../widgets/button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String name = preferences.getString('name')!;
    String email = preferences.getString('email')!;
    String mobNo = preferences.getString('mobile')!;
    String address = preferences.getString('address')!;
    String pass = preferences.getString('password')!;
    String coniformPass = preferences.getString('conpassword')!;

    setState(() {
      nameController.text = name;
      emailController.text = email;
      mobileNoController.text = mobNo;
      confPasswordController.text = coniformPass;
      addressController.text = address;
      passwordController.text = pass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, 50.h),
          child: const MyAppBar(title: 'Profile')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/icons/Profile picture.png'),
            SizedBox(height: 20.h),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset('assets/images/icons/Group 1894.png'),
              SizedBox(width: 5.w),
              const Text('Edit Profile', style: TextStyle(color: orange))
            ]),
            SizedBox(height: 10.h),
            Text('Hi there Emilia!',
                style: Theme.of(context).textTheme.headline6),
            SizedBox(height: 5.h),
            const SmallText(text: 'Sign Out'),
            SizedBox(height: 30.h),
            _buildUserInput(),
            _buildLoginButton(),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInput() {
    return Column(
      children: [
        MyTextField(
          hintText: 'Name',
          controller: nameController,
          validator: (value) => value!.isEmpty ? 'Name is required' : null,
        ),
        MyTextField(
          hintText: 'Email',
          controller: emailController,
          validator: (value) => emailValidator(value!),
        ),
        MyTextField(
          hintText: 'Mobile No',
          controller: mobileNoController,
          validator: (value) =>
              value!.isEmpty ? 'Mobile Number is required' : null,
        ),
        MyTextField(
          hintText: 'Address',
          controller: addressController,
          validator: (value) => value!.isEmpty ? 'Address is required' : null,
        ),
        MyTextField(
          hintText: 'Password',
          controller: passwordController,
          validator: (value) => passwordValidator(value!),
          obscure: true,
        ),
        MyTextField(
            hintText: 'Coniform Password',
            controller: confPasswordController,
            obscure: true,
            validator: (value) => coniformPassValidator(value!)),
      ],
    );
  }

  Widget _buildLoginButton() {
    return Button(
      onPressed: setData,
      widget: const Text('Save'),
      color: orange,
    );
  }

  setData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('name', nameController.text.trim());
    preferences.setString('email', emailController.text.trim());
    preferences.setString('mobile', mobileNoController.text.trim());
    preferences.setString('address', addressController.text.trim());
    preferences.setString('password', passwordController.text.trim());
    preferences.setString('conpassword', confPasswordController.text.trim());

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Data saved!'),
      backgroundColor: orange,
    ));
  }
}

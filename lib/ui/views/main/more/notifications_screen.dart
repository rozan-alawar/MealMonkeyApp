import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/app_bar.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 70.h),
        child: const MyAppBar(title: 'Notifications', haveLeading: true),
      ),
      body: ListView.builder(
        itemCount: 20,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 65.h,
                child: ListTile(
                  title: const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text('20 Jul 2020'),
                  ),
                  leading: Image.asset('assets/images/icons/Ellipse 92.png'),
                ),
              ),
              const Divider(thickness: 1)
            ],
          ),
        ),
      ),
    );
  }
}

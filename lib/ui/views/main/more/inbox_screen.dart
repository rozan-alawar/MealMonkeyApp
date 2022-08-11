import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/sub_text.dart';

import '../../../widgets/app_bar.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 70.h),
        child: const MyAppBar(title: 'Inbox', haveLeading: true),
      ),
      body: ListView.builder(
        itemCount: 7,
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
                    'MealMonkey Promotions',
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                      overflow: TextOverflow.ellipsis),
                  leading: Image.asset('assets/images/icons/Ellipse 92.png'),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '6th July',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Image.asset('assets/images/icons/star2.png')
                    ],
                  ),
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

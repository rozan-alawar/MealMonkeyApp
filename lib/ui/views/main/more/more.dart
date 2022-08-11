import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../component/constants.dart';
import '../../../widgets/app_bar.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, 50.h),
            child: const MyAppBar(title: 'More')),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              _buildActionTile(
                'assets/images/icons/002-income.png',
                'Payment Details',
                paymentDetailsRoute,
              ),
              _buildActionTile(
                'assets/images/icons/shopping-bag.png',
                'My Orders',
                myOrderRoute,
              ),
              _buildActionTile(
                'assets/images/icons/Notifications.png',
                'Notifications',
                notificationsRoute,
              ),
              _buildActionTile(
                'assets/images/icons/004-inbox-mail.png',
                'Inbox',
                inboxRoute,
              ),
              _buildActionTile(
                'assets/images/icons/005-info.png',
                'About Us',
                aboutUSRoute,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionTile(String image, String text, String route) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(route),
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
                left: 320.w,
                top: 45.h,
                child: const CircleAvatar(
                  backgroundColor: Color(0xffF4F4F4),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20),
              child: Container(
                padding: const EdgeInsets.all(10),
                width: 317.w,
                height: 90.h,
                decoration: BoxDecoration(
                    color: const Color(0xffF4F4F4),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color(0xffD8D8D8),
                      radius: 30.r,
                      child: Image.asset(
                        image,
                        width: 30.w,
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Text(
                      text,
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

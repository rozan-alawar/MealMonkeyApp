import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../component/constants.dart';
import '../../../widgets/bottom_sheet.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/button.dart';
import '../../../widgets/sub_text.dart';

class PaymentDetails extends StatelessWidget {
  PaymentDetails({Key? key}) : super(key: key);
  final cardNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 70.h),
          child: const MyAppBar(title: 'Payment Details', haveLeading: true),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Customize your payment method',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const Divider(indent: 20, endIndent: 20, thickness: 1),
            SizedBox(height: 20.h),
            paymentMethodsSection(context),
            SizedBox(height: 90.h),
            sendButton(context, 'Add Another Credit/Debit Card')
          ],
        ),
      ),
    );
  }

  Material paymentMethodsSection(BuildContext context) => Material(
        color: const Color(0xffF7F7F7),
        elevation: 20,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cash/Card on delivery',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Image.asset('assets/images/icons/Path 8612.png')
                ],
              ),
              SizedBox(height: 10.h),
              const Divider(thickness: 1),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/icons/visa.png'),
                  const SmallText(text: '****  ****'),
                  const Text('2187'),
                  SizedBox(
                    width: 120.w,
                    height: 40.h,
                    child: Button(
                        onPressed: () {},
                        widget: const Text(
                          'Delete Card',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        color: white),
                  )
                ],
              ),
              SizedBox(height: 10.h),
              const Divider(thickness: 1),
              SizedBox(height: 20.h),
              Text(
                'Other Methods',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      );

  Widget sendButton(BuildContext context, String text) => Center(
        child: Button(
            onPressed: () {
              bottomModelSheet(context);
            },
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/icons/plus.png'),
                SizedBox(width: 20.w),
                Text(
                  text,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            color: orange),
      );
}

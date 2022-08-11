import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/component/constants.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/bottom_sheet.dart';
import '../../../widgets/button.dart';
import '../../../widgets/sub_text.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool cashOnDelivery = false;
  bool visaNoIsChecked = false;
  bool pEmailIsChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 50.h),
        child: const MyAppBar(
            title: 'Checkout', haveLeading: true, haveTrailing: false),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            deliveryAddress(),
            rectangle(),
            _paymentMethodHeader(context),
            _paymentMethodDetails(
                const Text('Cash on delivery'), cashOnDelivery),
            _paymentMethodDetails(
              Row(
                children: [
                  Image.asset('assets/images/icons/visa.png'),
                  SizedBox(width: 5.w),
                  const Text('**** **** 2187')
                ],
              ),
              visaNoIsChecked,
            ),
            _paymentMethodDetails(
              Row(
                children: [
                  Image.asset('assets/images/icons/paypal.png'),
                  SizedBox(width: 5.w),
                  const Text('johndoe@email.com')
                ],
              ),
              pEmailIsChecked,
            ),
            SizedBox(height: 20.h),
            rectangle(),
            costDetails('Sub Total', '\$68'),
            costDetails('Delivery Cost', '\$2'),
            costDetails('Discount', '-\$4'),
            const Divider(thickness: 1, endIndent: 20, indent: 20),
            costDetails('Total', '-\$66'),
            rectangle(),
            SizedBox(height: 20.h),
            Center(
              child: Button(
                  onPressed: () {},
                  widget: const Text('Send Order'),
                  color: orange),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget deliveryAddress() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 100.h,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SmallText(text: 'Delivery Address'),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('653 Nostrand Ave., \nBrooklyn, NY 11216'),
                TextButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed(locationRout),
                  child: const Text(
                    'Change',
                    style:
                        TextStyle(color: orange, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget rectangle() {
    return Container(
      width: double.infinity,
      height: 12.h,
      color: cardBackground,
    );
  }

  Widget _paymentMethodHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.h),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Payment method',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          TextButton(
            onPressed: () {
              bottomModelSheet(context);
            },
            child: Row(
              children: [
                Image.asset(
                  'assets/images/icons/plus.png',
                  width: 10.w,
                  height: 10.h,
                  color: orange,
                ),
                SizedBox(width: 10.w),
                const Text('Add Card',
                    style: TextStyle(
                        color: orange,
                        fontSize: 13,
                        fontWeight: FontWeight.bold))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _paymentMethodDetails(Widget widget, bool isChecked) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        decoration: BoxDecoration(
            color: cardBackground, borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widget,
            Checkbox(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              fillColor: MaterialStateProperty.all(orange),
              value: isChecked,
              onChanged: (value) => setState(() {
                isChecked = value!;
              }),
            )
          ],
        ),
      ),
    );
  }

  Widget costDetails(String text, String cost) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: Text(text),
          ),
          Text(
            cost,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

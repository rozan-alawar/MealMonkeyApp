import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/button.dart';
import '../../../../component/constants.dart';
import '../../../widgets/app_bar.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 70.h),
        child: const MyAppBar(title: 'My Order', haveLeading: true),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            shopDetails(context),
            myOrderItems(),
            deliveryInstructions(context),
            const Divider(thickness: 1),
            costDetails(context, 'Sub Total', '58'),
            costDetails(context, 'Delivery Cost', '2'),
            const Divider(thickness: 1),
            costDetails(context, 'Total', '70'),
            SizedBox(height: 30.h),
            Button(
              onPressed: () => Navigator.of(context).pushNamed(checkoutRoute),
              widget: const Text('Checkout'),
              color: orange,
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  Widget shopDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 100.h,
        child: Row(
          children: [
            Image.asset(
              'assets/images/restaurents/Burgers.png',
              width: 100.w,
              height: 100.h,
              fit: BoxFit.fill,
            ),
            SizedBox(width: 30.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'King Burgers',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Row(
                  children: [
                    Image.asset('assets/images/icons/star.png'),
                    const SizedBox(width: 8),
                    Text(
                      '4.9',
                      style: TextStyle(color: orange, fontSize: 13.sp),
                    ),
                    const SizedBox(width: 8),
                    Text('(124 Ratings)',
                        style: TextStyle(color: grey, fontSize: 13.sp)),
                  ],
                ),
                Row(
                  children: [
                    Text('Burger',
                        style: TextStyle(color: grey, fontSize: 12.sp)),
                    const SizedBox(width: 8),
                    Image.asset('assets/images/icons/Ellipse 17.png',
                        width: 4, height: 4, fit: BoxFit.fill),
                    const SizedBox(width: 8),
                    Text(' Western Food',
                        style: TextStyle(color: grey, fontSize: 12.sp)),
                  ],
                ),
                Row(
                  children: [
                    Image.asset('assets/images/icons/location-pin.png'),
                    const SizedBox(width: 8),
                    Text(
                      'No 03, 4th Lane, Newyork',
                      style: TextStyle(color: grey, fontSize: 13.sp),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget myOrderItems() {
    return SizedBox(
      height: 290.h,
      child: Material(
        color: const Color(0xffF6F6F6),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              orderDetails('Beef Burger x1', '16'),
              const Divider(thickness: 1),
              orderDetails('Classic Burger x1', '14'),
              const Divider(thickness: 1),
              orderDetails('Cheese Chicken Burger x1', '17'),
              const Divider(thickness: 1),
              orderDetails('Chicken Legs Basket x1', '15'),
              const Divider(thickness: 1),
              orderDetails('French Fries Large x1', '6'),
            ],
          ),
        ),
      ),
    );
  }

  Widget orderDetails(String orderName, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(orderName),
          Text('\$$price'),
        ],
      ),
    );
  }

  Widget deliveryInstructions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Delivery instructions',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Image.asset(
            'assets/images/icons/plus.png',
            width: 10.w,
            height: 10.h,
            color: orange,
          ),
          SizedBox(width: 10.w),
          const Text('Add Note',
              style: TextStyle(
                  color: orange, fontSize: 13, fontWeight: FontWeight.w500))
        ],
      ),
    );
  }

  Widget costDetails(BuildContext context, String text, String cost) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Text(cost,
              style: const TextStyle(
                  color: orange, fontSize: 13, fontWeight: FontWeight.w500))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../component/constants.dart';
import '../widgets/button.dart';
import '../widgets/text_field.dart';

Future<dynamic> bottomModelSheet(BuildContext context) {
  final cardNumberController = TextEditingController();

  return showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 50,
      constraints: const BoxConstraints(maxHeight: 700),
      context: context,
      builder: (context) => Container(
            color: white,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Add Credit/Debit Card',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const Divider(indent: 20, endIndent: 20, thickness: 1),
                    SizedBox(height: 10.h),
                    MyTextField(
                      hintText: 'Card Number',
                      controller: cardNumberController,
                      validator: (value) {
                        return null;
                      },
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          'Expiry',
                          style: Theme.of(context).textTheme.titleMedium,
                        )),
                        SizedBox(
                          width: 103.w,
                          height: 55.h,
                          child: MyTextField(
                              hintText: 'MM',
                              controller: cardNumberController,
                              validator: (value) {
                                return null;
                              }),
                        ),
                        SizedBox(width: 30.w),
                        SizedBox(
                          width: 103.w,
                          height: 55.h,
                          child: MyTextField(
                              hintText: 'YY',
                              controller: cardNumberController,
                              validator: (value) {
                                return null;
                              }),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    MyTextField(
                      hintText: 'Security Code',
                      controller: cardNumberController,
                      validator: (value) {
                        return null;
                      },
                    ),
                    MyTextField(
                      hintText: 'First Name',
                      controller: cardNumberController,
                      validator: (value) {
                        return null;
                      },
                    ),
                    MyTextField(
                      hintText: 'Last Name',
                      controller: cardNumberController,
                      validator: (value) {
                        return null;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'You can remove this card at anytime ',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Image.asset('assets/images/icons/Group 8099.png')
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Button(
                        onPressed: () {},
                        widget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/icons/plus.png'),
                            SizedBox(width: 20.w),
                            const Text(
                              'Add Card',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        color: orange),
                  ],
                ),
              ),
            ),
          ));
}

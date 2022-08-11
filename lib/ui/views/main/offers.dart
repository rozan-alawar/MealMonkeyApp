import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../component/constants.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/button.dart';
import '../../widgets/sub_text.dart';

import '../../view_models/restaurents.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({Key? key}) : super(key: key);

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, 50.h),
          child: const MyAppBar(title: 'Latest Offers')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: SmallText(
              text: 'Find discounts, Offers special\nmeals and more!',
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 20),
            child: SizedBox(
              width: 170.w,
              height: 40.h,
              child: Button(
                  onPressed: () {},
                  widget: const Text('chek out'),
                  color: orange),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 800.h,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: Restaurents.restaurents.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: SizedBox(
                    height: 270.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildRestaurentImage(index),
                        const SizedBox(height: 10),
                        _buildRestaurentName(index),
                        _buildRestaurantDetails(index),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRestaurentImage(int index) {
    return Image.asset(
      Restaurents.restaurentOffers[index].image,
      width: double.infinity,
      height: 195.h,
      fit: BoxFit.fill,
    );
  }

  Widget _buildRestaurentName(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 5),
      child: Text(
        Restaurents.restaurentOffers[index].name,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
    );
  }
}

Widget _buildRestaurantDetails(int index) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0),
    child: Row(
      children: [
        Image.asset('assets/images/icons/star.png'),
        const SizedBox(width: 5),
        Text(
          Restaurents.restaurents[index].rating.toString(),
          style: const TextStyle(color: orange, fontSize: 16),
        ),
        const SizedBox(width: 5),
        const Text('(124 ratings) Café ', style: TextStyle(color: grey)),
        const SizedBox(width: 5),
        Image.asset(
          'assets/images/icons/Ellipse 17.png',
          width: 4,
          height: 4,
          fit: BoxFit.fill,
        ),
        const SizedBox(width: 5),
        const Text(' Western Food', style: TextStyle(color: grey))
      ],
    ),
  );
}

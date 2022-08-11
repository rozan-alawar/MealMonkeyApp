import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../component/constants.dart';
import '../../../view_models/restaurents.dart';

class PopularRestaurant extends StatelessWidget {
  const PopularRestaurant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: SizedBox(
        height: 780.h,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: Restaurents.restaurents.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: SizedBox(
              height: 250.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    Restaurents.restaurents[index].image,
                    width: double.infinity,
                    height: 180.h,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0.w, bottom: 5.h),
                    child: Text(
                      Restaurents.restaurents[index].name,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                  _buildRestaurantDetails(index),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRestaurantDetails(int index) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0.w),
      child: Row(
        children: [
          Image.asset(
            'assets/images/icons/star.png',
            width: 20,
            height: 20,
          ),
          SizedBox(width: 5.w),
          Text(
            Restaurents.restaurents[index].rating.toString(),
            style: const TextStyle(color: orange, fontSize: 13),
          ),
          SizedBox(width: 5.w),
          const Text('(124 ratings) Café ',
              style: TextStyle(
                color: grey,
                fontSize: 13,
              )),
          SizedBox(width: 5.w),
          Image.asset(
            'assets/images/icons/Ellipse 17.png',
            width: 4.w,
            height: 4.h,
            fit: BoxFit.fill,
          ),
          SizedBox(width: 5.w),
          const Text(' Western Food',
              style: TextStyle(color: grey, fontSize: 13))
        ],
      ),
    );
  }
}

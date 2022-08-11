import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../component/constants.dart';
import '../../../view_models/restaurents.dart';

class BuildRecentItems extends StatelessWidget {
  const BuildRecentItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 480.h,
      width: double.infinity,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: Restaurents.recentItems.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    Restaurents.recentItems[index].image,
                    width: 100.w,
                    fit: BoxFit.fill,
                  )),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Restaurents.recentItems[index].name,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text('Café',
                          style: TextStyle(color: grey, fontSize: 12.sp)),
                      const SizedBox(width: 8),
                      Image.asset('assets/images/icons/Ellipse 17.png',
                          width: 4, height: 4, fit: BoxFit.fill),
                      const SizedBox(width: 8),
                      Text(' Western Food',
                          style: TextStyle(color: grey, fontSize: 12.sp)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Image.asset('assets/images/icons/star.png'),
                      const SizedBox(width: 8),
                      Text(
                        '4.9',
                        style: TextStyle(color: orange, fontSize: 12.sp),
                      ),
                      const SizedBox(width: 8),
                      Text('(124 Ratings)',
                          style: TextStyle(color: grey, fontSize: 12.sp)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

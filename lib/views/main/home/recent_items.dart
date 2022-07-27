import 'package:flutter/material.dart';
import 'package:meal_monkey/constants/constants.dart';
import 'package:meal_monkey/models/resturant.dart';

class BuildRecentItems extends StatelessWidget {
  const BuildRecentItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView.builder(
        itemCount: Restaurant.recentItems.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    Restaurant.recentItems[index].image,
                    width: 100,
                    fit: BoxFit.fill,
                  )),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Mulberry Pizza by Josh',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Text('Café', style: TextStyle(color: grey)),
                      const SizedBox(width: 8),
                      Image.asset('assets/images/Ellipse 17.png',
                          width: 4, height: 4, fit: BoxFit.fill),
                      const SizedBox(width: 8),
                      const Text(' Western Food',
                          style: TextStyle(color: grey)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Image.asset('assets/images/star.png'),
                      const SizedBox(width: 8),
                      const Text(
                        '4.9',
                        style: TextStyle(color: orange),
                      ),
                      const SizedBox(width: 8),
                      const Text('(124 Ratings)',
                          style: TextStyle(color: grey)),
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

import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../models/resturant.dart';

class MostPopularRestaurant extends StatelessWidget {
  const MostPopularRestaurant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: _buildMostPopularRestaurantList(),
    );
  }

  Widget _buildMostPopularRestaurantList() {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: ListView.builder(
        itemCount: Restaurant.mostPopularResturants.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(left: 20.0, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                      Restaurant.mostPopularResturants[index].image)),
              const SizedBox(height: 5),
              Text(
                Restaurant.restaurants[index].name,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              _buildPopularRestDetails(index),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPopularRestDetails(int index) {
    return Row(
      children: [
        const Text('Café ', style: TextStyle(color: grey)),
        const SizedBox(width: 5),
        Image.asset(
          'assets/images/Ellipse 17.png',
          width: 4,
          height: 4,
          fit: BoxFit.fill,
        ),
        const SizedBox(width: 5),
        const Text(' Western Food', style: TextStyle(color: grey)),
        const SizedBox(width: 10),
        Image.asset('assets/images/star.png'),
        const SizedBox(width: 5),
        Text(
          Restaurant.restaurants[index].rating.toString(),
          style: const TextStyle(color: orange, fontSize: 16),
        ),
      ],
    );
  }
}

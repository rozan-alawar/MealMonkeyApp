import 'package:flutter/material.dart';
import 'package:meal_monkey/constants/constants.dart';
import 'package:meal_monkey/models/resturant.dart';

class PopularRestaurant extends StatelessWidget {
  const PopularRestaurant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: SizedBox(
        height: 500,
        child: ListView.builder(
          itemCount: Restaurant.restaurants.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  Restaurant.restaurants[index].image,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 5),
                  child: Text(
                    Restaurant.restaurants[index].name,
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
    );
  }

  Widget _buildRestaurantDetails(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(
        children: [
          Image.asset('assets/images/star.png'),
          const SizedBox(width: 5),
          Text(
            Restaurant.restaurants[index].rating.toString(),
            style: const TextStyle(color: orange, fontSize: 16),
          ),
          const SizedBox(width: 5),
          const Text('(124 ratings) Café ', style: TextStyle(color: grey)),
          const SizedBox(width: 5),
          Image.asset(
            'assets/images/Ellipse 17.png',
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
}

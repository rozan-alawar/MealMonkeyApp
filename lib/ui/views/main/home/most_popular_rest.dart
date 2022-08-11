import 'package:flutter/material.dart';
import '../../../../component/constants.dart';
import '../../../view_models/restaurents.dart';

class MostPopularRestaurents extends StatelessWidget {
  const MostPopularRestaurents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: _buildMostPopularRestaurentsList(),
    );
  }

  Widget _buildMostPopularRestaurentsList() {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: ListView.builder(
        itemCount: Restaurents.mostPopularResturants.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(left: 20.0, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                      Restaurents.mostPopularResturants[index].image)),
              const SizedBox(height: 5),
              Text(
                Restaurents.restaurents[index].name,
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
          'assets/images/icons/Ellipse 17.png',
          width: 4,
          height: 4,
          fit: BoxFit.fill,
        ),
        const SizedBox(width: 5),
        const Text(' Western Food', style: TextStyle(color: grey)),
        const SizedBox(width: 10),
        Image.asset('assets/images/icons/star.png'),
        const SizedBox(width: 5),
        Text(
          Restaurents.restaurents[index].rating.toString(),
          style: const TextStyle(color: orange, fontSize: 16),
        ),
      ],
    );
  }
}

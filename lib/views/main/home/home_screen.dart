import 'package:flutter/material.dart';
import 'package:meal_monkey/constants/constants.dart';
import 'package:meal_monkey/responsive/base_widget.dart';
import 'package:meal_monkey/views/main/home/category.dart';
import 'package:meal_monkey/views/main/home/most_popular_rest.dart';
import 'package:meal_monkey/views/main/home/popular_Restaurant.dart';
import 'package:meal_monkey/views/main/home/recent_items.dart';
import 'package:meal_monkey/widgets/custom_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Object? name = ModalRoute.of(context)!.settings.arguments;
    final searchController = TextEditingController();

    return BaseWidget(
      builder: (context, deviceInfo) => Scaffold(
        appBar: myAppBar(text: 'Good morning $name!'),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: smallText(text: 'delivary to'),
              ),
              _buildCurrentLocation(),
              const SizedBox(height: 15),
              buildSearchFoodBox(deviceInfo, searchController),
              const SizedBox(height: 25),
              const Categories(),
              _buildSectionHeader('Popular Restaurents'),
              const PopularRestaurant(),
              _buildSectionHeader('Most Popular'),
              const MostPopularRestaurant(),
              _buildSectionHeader('Recent items'),
              const BuildRecentItems()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentLocation() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: const [
          Text('Current Location',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(width: 5),
          Icon(Icons.keyboard_arrow_down_outlined, color: orange),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 20),
          ),
          const Text('view all', style: TextStyle(color: orange, fontSize: 17))
        ],
      ),
    );
  }
}

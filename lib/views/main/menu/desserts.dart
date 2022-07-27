import 'package:flutter/material.dart';
import 'package:meal_monkey/responsive/base_widget.dart';
import 'package:meal_monkey/widgets/custom_widget.dart';

class Desserts extends StatelessWidget {
  const Desserts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return Scaffold(
      appBar: myAppBar(text: 'Desserts', automaticallyImplyLeading: true),
      body: BaseWidget(
        builder: (context, deviceInfo) => SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              buildSearchFoodBox(deviceInfo, searchController),
            ],
          ),
        ),
      ),
    );
  }
}

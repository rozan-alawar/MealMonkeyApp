import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../component/constants.dart';
import '../../../view_models/desserts.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/search_food_box.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({Key? key}) : super(key: key);

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: MyAppBar(
            title: 'Food',
            haveLeading: true,
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          FoodSearchBox(searchController: searchController),
          Expanded(
            child: ListView.builder(
              itemCount: Dessert.desserts.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: GestureDetector(
                  child: _buildItemCard(index),
                  onTap: () => Navigator.of(context).pushNamed(productRoute,
                      arguments: Dessert.desserts[index]),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildItemCard(int index) {
    return Stack(
      children: [
        _buildItemImage(index),
        _buildItemName(index),
        _buildItemDetails(index),
      ],
    );
  }

  Widget _buildItemImage(int index) {
    return Image.asset(
      Dessert.desserts[index].image,
      width: 375.w,
      height: 210.h,
      fit: BoxFit.cover,
    );
  }

  Widget _buildItemName(int index) {
    return Positioned(
        bottom: 40,
        left: 20,
        child: Text(
          Dessert.desserts[index].name,
          style: const TextStyle(
              color: white, fontWeight: FontWeight.bold, fontSize: 20),
        ));
  }

  Widget _buildItemDetails(int index) {
    return Positioned(
        bottom: 15,
        left: 20,
        child: Row(
          children: [
            Image.asset('assets/images/icons/star.png'),
            const SizedBox(width: 5),
            Text(
              Dessert.desserts[index].rating.toString(),
              style:
                  const TextStyle(color: orange, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 5),
            Text(Dessert.desserts[index].restaurant.name.toString(),
                style: const TextStyle(color: white)),
            const SizedBox(width: 5),
            Image.asset(
              'assets/images/icons/Ellipse 17.png',
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 5),
            const Text('Desserts', style: TextStyle(color: white))
          ],
        ));
  }
}

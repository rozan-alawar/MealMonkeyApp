import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'most_popular_rest.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../component/constants.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/search_food_box.dart';
import '../../../widgets/sub_text.dart';
import 'category.dart';
import 'popular_restaurant.dart';
import 'recent_items.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _name = '';

  Future<String> getname() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String name = preferences.getString('name')!;
    setState(() {
      _name = name;
    });

    return name;
  }

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    getname().then((value) => _name = value);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.h),
          child: MyAppBar(title: 'Good morning $_name!')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: SmallText(text: 'delivary to'),
            ),
            _buildCurrentLocation(),
            SizedBox(height: 15.h),
            FoodSearchBox(searchController: searchController),
            SizedBox(height: 25.h),
            const Categories(),
            _buildSectionHeader('Popular Restaurents'),
            const PopularRestaurant(),
            _buildSectionHeader('Most Popular'),
            const MostPopularRestaurents(),
            _buildSectionHeader('Recent items'),
            const BuildRecentItems()
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentLocation() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
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
      padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 20.sp),
          ),
          Text('view all', style: TextStyle(color: orange, fontSize: 17.sp))
        ],
      ),
    );
  }
}

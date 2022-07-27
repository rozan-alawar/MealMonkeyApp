import 'package:flutter/material.dart';
import 'package:meal_monkey/models/category.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: SizedBox(
        width: double.infinity,
        height: 120,
        child: ListView.builder(
            itemCount: Category.categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Column(
                    children: [
                      Image.asset(Category.categories[index].image),
                      const SizedBox(height: 10),
                      Text(
                        Category.categories[index].name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )),
      ),
    );
  }
}

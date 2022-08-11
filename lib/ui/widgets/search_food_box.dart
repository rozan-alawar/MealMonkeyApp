import 'package:flutter/material.dart';
import 'text_field.dart';

class FoodSearchBox extends StatelessWidget {
  final TextEditingController searchController;

  const FoodSearchBox({Key? key, required this.searchController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: MyTextField(
          hintText: 'Search food',
          controller: searchController,
          validator: (value) => null,
          withPrefixIcon: true),
    );
  }
}

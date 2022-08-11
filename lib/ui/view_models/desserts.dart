import 'restaurents.dart';

class Dessert {
  final String image;
  final String name;
  final Restaurents restaurant;
  final double rating;
  final double price;

  Dessert(
      {required this.image,
      required this.name,
      required this.restaurant,
      required this.rating,
      required this.price});

  static List<Dessert> desserts = [
    Dessert(
        image:
            'assets/images/desserts/food-photographer-david-fedulov-hAUyjrUb-s8-unsplash.png',
        name: 'French Apple Pie',
        restaurant: Restaurents.restaurents[0],
        rating: 4.9,
        price: 750),
    Dessert(
        image: 'assets/images/desserts/max-panama-AWFYboL6BE4-unsplash.png',
        name: 'Dark Chocolate Cake',
        restaurant: Restaurents.restaurents[1],
        rating: 4.9,
        price: 750),
    Dessert(
        image: 'assets/images/desserts/muhammad-usman-OSpvTwWvjmU-unsplash.png',
        name: 'Street Shake',
        restaurant: Restaurents.restaurents[2],
        rating: 4.9,
        price: 750),
    Dessert(
        image:
            'assets/images/desserts/gita-krishnamurti-6LXGXGNYn24-unsplash.png',
        name: 'Fudgy Chewy Brownies',
        restaurant: Restaurents.restaurents[2],
        rating: 4.9,
        price: 750),
  ];
}

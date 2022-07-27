class Restaurant {
  final int id;
  final String name;
  final String image;
  final double rating;

  Restaurant(
      {required this.id,
      required this.name,
      required this.image,
      required this.rating});

  static List<Restaurant> restaurants = [
    Restaurant(
        id: 1,
        name: 'Minute by tuk tuk',
        image: 'assets/images/Minute by tuk tuk.png',
        rating: 4.9),
    Restaurant(
        id: 2,
        name: 'Café de Noir',
        image: 'assets/images/Café de Noir.png',
        rating: 4.8),
    Restaurant(
        id: 3,
        name: 'Bakes by Tella',
        image: 'assets/images/Bakes by Tella.png',
        rating: 4.9),
  ];

  static List<Restaurant> mostPopularResturants = [
    Restaurant(
        id: 4,
        name: 'Café De Bambaa',
        image: 'assets/images/Café De Bambaa.png',
        rating: 4.9),
    Restaurant(
        id: 5,
        name: 'Burger by Bella',
        image: 'assets/images/Burger by Bella.png',
        rating: 4.8),
  ];

  static List<Restaurant> recentItems = [
    Restaurant(
        id: 7,
        name: 'Mulberry Pizza by Josh',
        image: 'assets/images/Mulberry Pizza by Josh.png',
        rating: 4.9),
    Restaurant(
        id: 8, name: 'Barita', image: 'assets/images/Barita.png', rating: 4.8),
    Restaurant(
        id: 8,
        name: 'Pizza Rush Hour',
        image: 'assets/images/Pizza Rush Hour.png',
        rating: 4.9),
  ];
}

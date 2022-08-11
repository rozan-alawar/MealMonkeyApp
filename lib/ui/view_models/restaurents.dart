class Restaurents {
  final int id;
  final String name;
  final String image;
  final double rating;

  Restaurents(
      {required this.id,
      required this.name,
      required this.image,
      required this.rating});

  static List<Restaurents> restaurents = [
    Restaurents(
        id: 1,
        name: 'Minute by tuk tuk',
        image: 'assets/images/restaurents/Minute by tuk tuk.png',
        rating: 4.9),
    Restaurents(
        id: 2,
        name: 'Café de Noir',
        image: 'assets/images/restaurents/Café de Noir.png',
        rating: 4.8),
    Restaurents(
        id: 3,
        name: 'Bakes by Tella',
        image: 'assets/images/restaurents/Bakes by Tella.png',
        rating: 4.9),
  ];

  static List<Restaurents> mostPopularResturants = [
    Restaurents(
        id: 4,
        name: 'Café De Bambaa',
        image: 'assets/images/restaurents/Café De Bambaa.png',
        rating: 4.9),
    Restaurents(
        id: 5,
        name: 'Burger by Bella',
        image: 'assets/images/restaurents/Burger by Bella.png',
        rating: 4.8),
  ];

  static List<Restaurents> recentItems = [
    Restaurents(
        id: 7,
        name: 'Mulberry Pizza by Josh',
        image: 'assets/images/restaurents/Mulberry Pizza by Josh.png',
        rating: 4.9),
    Restaurents(
        id: 8,
        name: 'Barita',
        image: 'assets/images/restaurents/Barita.png',
        rating: 4.8),
    Restaurents(
        id: 9,
        name: 'Pizza Rush Hour',
        image: 'assets/images/restaurents/Pizza Rush Hour.png',
        rating: 4.9),
  ];

  static List<Restaurents> restaurentOffers = [
    Restaurents(
        id: 10,
        name: 'Café de Noires',
        image: 'assets/images/restaurents/Café de Noir.png',
        rating: 4.9),
    Restaurents(
        id: 11,
        name: 'Isso',
        image: 'assets/images/restaurents/davide-cantelli-jpkfc5_d-DI-unsplash.png',
        rating: 4.9),
    Restaurents(
        id: 12,
        name: 'Cafe Beans',
        image: 'assets/images/restaurents/nathan-dumlao-zUNs99PGDg0-unsplash.png',
        rating: 4.9),
  ];
}

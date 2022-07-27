class Category {
  final int id;
  final String name;
  final String image;

  Category({required this.id, required this.name, required this.image});

  static List<Category> categories = [
    Category(id: 1, name: 'Offers', image: 'assets/images/offers.png'),
    Category(id: 2, name: 'Sri Lankan', image: 'assets/images/SriLankan.png'),
    Category(id: 3, name: 'Italian', image: 'assets/images/Italian.png'),
    Category(id: 4, name: 'Indian', image: 'assets/images/Indian.png'),
  ];
}

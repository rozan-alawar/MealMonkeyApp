class OnbordingContent {
  final String image, title, description;

  OnbordingContent({
    required this.image,
    required this.title,
    required this.description,
  });

  static List<OnbordingContent> content = [
    OnbordingContent(
      image: "assets/images/bording/Find food you love vector.png",
      title: "Find Food You Love",
      description:
          'Discover the best foods from over 1,000 \nrestaurants and fast delivery to your doorstep',
    ),
    OnbordingContent(
      image: "assets/images/bording/Delivery vector.png",
      title: "Fast Delivery",
      description: 'Fast food delivery to your home, office \nwherever you are',
    ),
    OnbordingContent(
      image: "assets/images/bording/Live tracking vector.png",
      title: "Live Tracking",
      description:
          'Real time tracking of your food on the app \nonce you placed the order',
    ),
  ];
}

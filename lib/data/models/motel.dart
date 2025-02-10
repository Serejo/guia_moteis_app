class Motel {
  final String name;
  final double price;
  final String imageUrl;

  Motel({
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  factory Motel.fromJson(Map<String, dynamic> json) {
    return Motel(
      name: json['name'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      imageUrl: json['image_url'] ?? '',
    );
  }
}

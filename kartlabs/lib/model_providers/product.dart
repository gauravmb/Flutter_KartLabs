class Product {
  final String name;
  final String price;
  final String description;
  final String thumbnailUrl;
  final String categoryId;
  final List<String> images;

  Product({
    required this.name,
    required this.price,
    required this.description,
    required this.thumbnailUrl,
    required this.categoryId,
    required this.images,
  });

  Map toJson() => {
        'name': name,
        'price': price,
        'description': description,
        'thumbnailUrl': thumbnailUrl,
        'categoryId': thumbnailUrl,
      };

  factory Product.fromJson(dynamic value) {
    return Product(
      price: value['price'],
      name: value['name'],
      description: value['description'],
      images: [],
      thumbnailUrl: value['thumbnailUrl'],
      categoryId: value['categoryId'],
    );
  }
}

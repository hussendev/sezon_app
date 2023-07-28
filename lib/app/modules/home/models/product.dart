class Product {
  int id;
  int categoryId;
  String name;
  dynamic price;
  List<String> images;
  String details;

  Product({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.price,
    required this.images,
    required this.details,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id']  ,
      categoryId: json['category_id']  ,
      name: json['name'] as String,
      price: json['price'],
      images: List<String>.from(json['images']),
      details: json['details'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['images'] = List<dynamic>.from(images);
    data['details'] = this.details;
    return data;
  }
}

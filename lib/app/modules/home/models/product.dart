class Product {
  int id;
  int categoryId;
  String name;
  dynamic price;
  List<String> images;
  String details;
  int purchaseCount;
  String dateAdded;


  Product({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.price,
    required this.images,
    required this.details,
    required this.purchaseCount,
    required this.dateAdded
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id']  ,
      categoryId: json['category_id']  ,
      name: json['name'] as String,
      price: json['price'],
      images: List<String>.from(json['images']),
      details: json['details'] as String,
      purchaseCount: json['purchase_count'] ,
      dateAdded: json['date_added'] as String,
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
    data['purchase_count'] = this.purchaseCount;
    data['date_added'] = this.dateAdded;
    return data;
  }
}

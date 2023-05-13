class ProductResponseModel {
  List<ProductModel> listProduct;
  ProductResponseModel({
    required this.listProduct,
  });
  factory ProductResponseModel.fromJson(dynamic json) => ProductResponseModel(
      listProduct:
          List<ProductModel>.from(json.map((x) => ProductModel.fromJson(x))));
}

class ProductModel {
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
  });
  int id;
  String title;
  dynamic price;
  String category;
  String description;
  String image;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      id: json["id"],
      title: json["title"],
      price: json["price"],
      category: json["category"],
      description: json["description"],
      image: json["image"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "category": category,
        "description": description,
        "image": image,
      };
}

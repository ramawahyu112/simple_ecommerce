class ProductResponseModel {
  List<ProductModel> listProduct;
  ProductResponseModel({
    required this.listProduct,
  });
  factory ProductResponseModel.fromJson(dynamic json) => ProductResponseModel(
      listProduct: List<ProductModel>.from(json["data"].map((x) => ProductModel.fromJson(x))));
}

class ProductModel {
  ProductModel({
    required this.id,
    required this.productName,
    required this.price,
    required this.category,
    required this.description,
    required this.photo,
  });
  int id;
  String productName;
  dynamic price;
  String category;
  String description;
  String photo;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      id: json["id"],
      productName: json["product_name"],
      price: json["price"],
      category: json["category"],
      description: json["description"],
      photo: json["photo"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_name": productName,
        "price": price,
        "category": category,
        "description": description,
        "photo": photo,
      };
}

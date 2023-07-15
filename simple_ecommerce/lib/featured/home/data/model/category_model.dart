class CategoryResponseModel {
  CategoryResponseModel({
    required this.message,
    required this.listCategory,
  });
  String message;
  List<CategoryModel> listCategory;
  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) => CategoryResponseModel(
      message: json["message"],
      listCategory: List<CategoryModel>.from(json["data"].map((x) => CategoryModel.fromJson(x))));
}

class CategoryModel {
  CategoryModel({
    required this.id,
    required this.name,
  });
  int id;
  String name;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      CategoryModel(id: json["id"], name: json["name"]);
}

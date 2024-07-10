// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  int? id;
  String? name;
  String? description;
  double? price;
  String? image1;
  String? image2;
  int? idCategory;
  DateTime? createdAt;
  DateTime? updateAt;
  int? quantity;//para la bolsa de compra

  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.image1,
    this.image2,
    this.idCategory,
    this.createdAt,
    this.updateAt,
    this.quantity
  });

  //transforma una lista de objeto json a una listo de product
  static List<Product> fromJsonList(List<dynamic> jsonList) {
    List<Product> toList = [];
    jsonList.forEach((item) {
      Product product = Product.fromJson(item);
      toList.add(product);
    });

    return toList;
  }

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"] ?? '',
        description: json["description"] ?? '',
        price: json["price"] is String
            ? double.parse(json["price"])
            : json["price"] is int
                ? (json["price"] as int).toDouble()
                : json["price"],
        image1: json["image1"],
        image2: json["image2"],
        idCategory: json["id_category"] is String
            ? int.parse(json["id_category"])
            : json["id_category"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updateAt: json["update_at"] == null
            ? null
            : DateTime.parse(json["update_at"]),
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "image1": image1,
        "image2": image2,
        "id_category": idCategory,
        "created_at": createdAt?.toIso8601String(),
        "update_at": updateAt?.toIso8601String(),
        "quantity": quantity,
      };
}

import 'package:test_clean_architecture/features/showProduct/domain/entites/product.dart';

class ProductModel extends ProductEntite {
  ProductModel(
      super.id, super.name, super.totalPrice, super.desc, super.imageUrl);

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        json['id'],
        json['imageUrl'],
        json['name'],
        json['totalPrice'],
        json['desc'],
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'totalPrice': totalPrice,
      'desc': desc,
    };
  }
}

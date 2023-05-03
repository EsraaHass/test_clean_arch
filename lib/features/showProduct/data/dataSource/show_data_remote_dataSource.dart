import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_clean_architecture/features/showProduct/data/models/product_model.dart';

abstract class ShowDataRemoteDataSource {
  Future<List<ProductModel>> getMainProduct();
}

class ShowDataRemoteDataSourceImpl implements ShowDataRemoteDataSource {
  final firestore = FirebaseFirestore.instance.collection('product');

  @override
  Future<List<ProductModel>> getMainProduct() async {
    var data = await firestore.get();
    var products = data.docs
        .map((product) => ProductModel.fromJson(product.data()))
        .toList();

    return products;
  }
}

import 'package:test_clean_architecture/features/showProduct/domain/entites/product.dart';

abstract class ShowDataRepo {
  Future<List<ProductEntite>> getMainProduct();
}

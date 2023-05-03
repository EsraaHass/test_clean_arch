import 'package:test_clean_architecture/features/showProduct/data/dataSource/show_data_remote_dataSource.dart';
import 'package:test_clean_architecture/features/showProduct/domain/entites/product.dart';

import '../../domain/repositories/repo.dart';

class ShowDataRepoImple implements ShowDataRepo {
  ShowDataRemoteDataSource showDataRemoteDataSource;

  ShowDataRepoImple(this.showDataRemoteDataSource);

  @override
  Future<List<ProductEntite>> getMainProduct() async {
    return await showDataRemoteDataSource.getMainProduct();
  }
}

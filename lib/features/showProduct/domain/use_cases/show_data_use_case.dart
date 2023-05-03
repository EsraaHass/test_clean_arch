import 'package:test_clean_architecture/features/showProduct/domain/entites/product.dart';
import 'package:test_clean_architecture/features/showProduct/domain/repositories/repo.dart';

class ShowDataUseCase {
  ShowDataRepo showDataRepo;

  ShowDataUseCase(this.showDataRepo);

  Future<List<ProductEntite>> getMainProduct() async {
    return await showDataRepo.getMainProduct();
  }
}

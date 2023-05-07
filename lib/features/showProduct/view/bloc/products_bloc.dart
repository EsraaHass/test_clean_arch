import 'package:bloc/bloc.dart';
import 'package:test_clean_architecture/features/showProduct/view/bloc/products_event.dart';
import 'package:test_clean_architecture/features/showProduct/view/bloc/products_state.dart';

import '../../data/dataSource/show_data_remote_dataSource.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitialState()) {
    on<ProductsEvent>((event, emit) async {
      emit(ProductsInitialState());

      try {
        var products = await ShowDataRemoteDataSource.getMainProduct();
        await Future.delayed(const Duration(seconds: 1));
        emit(GetProductState(products: products));
      } catch (e) {
        print('error message = ${e.toString()}');
        emit(ErrorProductState(e.toString()));
      }
    });
  }
}

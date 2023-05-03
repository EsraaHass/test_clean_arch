import 'package:bloc/bloc.dart';
import 'package:test_clean_architecture/features/showProduct/domain/use_cases/show_data_use_case.dart';
import 'package:test_clean_architecture/features/showProduct/view/bloc/products_event.dart';
import 'package:test_clean_architecture/features/showProduct/view/bloc/products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ShowDataUseCase showDataUseCase;

  ProductsBloc(this.showDataUseCase) : super(ProductsInitialState()) {
    on<ProductsEvent>((event, emit) async {
      emit(ProductsInitialState());

      try {
        var products = await showDataUseCase.getMainProduct();
        await Future.delayed(const Duration(seconds: 1));
        emit(GetProductState(products: products));
      } catch (e) {
        print('error message = ${e.toString()}');
        emit(ErrorProductState(e.toString()));
      }
    });
  }
}

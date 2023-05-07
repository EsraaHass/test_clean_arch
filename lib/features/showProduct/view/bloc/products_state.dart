import 'package:equatable/equatable.dart';
import 'package:test_clean_architecture/features/showProduct/data/models/productsResponse.dart';

abstract class ProductsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductsInitialState extends ProductsState {}

class ErrorProductState extends ProductsState {
  String errorMessage;

  ErrorProductState(this.errorMessage);
}

class GetProductState extends ProductsState {
  ProductsResponse products;

  GetProductState({required this.products});
}

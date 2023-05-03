import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_clean_architecture/features/showProduct/data/dataSource/show_data_remote_dataSource.dart';
import 'package:test_clean_architecture/features/showProduct/data/repository/showdata_repo_impl.dart';
import 'package:test_clean_architecture/features/showProduct/domain/repositories/repo.dart';
import 'package:test_clean_architecture/features/showProduct/domain/use_cases/show_data_use_case.dart';
import 'package:test_clean_architecture/features/showProduct/view/bloc/products_bloc.dart';
import 'package:test_clean_architecture/features/showProduct/view/bloc/products_event.dart';
import 'package:test_clean_architecture/features/showProduct/view/bloc/products_state.dart';
import 'package:test_clean_architecture/features/showProduct/view/widget/product_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ProductsBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<ProductsBloc>(context);
    bloc.add(GetProductEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ShowDataRemoteDataSource dataRemoteDataSource =
        ShowDataRemoteDataSourceImpl();
    ShowDataRepo showDataRepo = ShowDataRepoImple(dataRemoteDataSource);
    ShowDataUseCase showDataUseCase = ShowDataUseCase(showDataRepo);
    return BlocProvider(
      create: (context) => ProductsBloc(showDataUseCase),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Clean Arch'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              BlocBuilder<ProductsBloc, ProductsState>(
                  builder: (context, state) {
                if (state is ProductsInitialState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is GetProductState) {
                  var products = state.products;

                  return GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (_, index) {
                      return ProductWidget(
                        category: products[index],
                      );
                    },
                    itemCount: state.products.length,
                  );
                } else {
                  // print("the State Change"");
                  return Center(
                    child: Text("the State Change"),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}

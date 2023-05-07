import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_clean_architecture/features/showProduct/data/dataSource/show_data_remote_dataSource.dart';
import 'package:test_clean_architecture/features/showProduct/data/models/productsResponse.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show Products.'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<ProductsResponse>(
            builder: (buildContext, snapshot) {
              if (snapshot.hasError) {
                print('error = ${snapshot.error.toString()}');
                return Text('error = ${snapshot.error.toString()}');
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: const CircularProgressIndicator());
              }
              var productData = snapshot.data;
              if (productData?.status == false) {
                return Text(productData?.message);
              }
              var products = productData?.data?.data;
              return ListView.separated(
                separatorBuilder: (_, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemBuilder: (_, index) {
                  return Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(14.0),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          height: 100,
                          width: 100,
                          imageUrl: products?[index].image ?? "",
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(child: Text(products?[index].name ?? ''))
                    ],
                  );
                },
                itemCount: products?.length ?? 7,
              );
            },
            future: ShowDataRemoteDataSource.getMainProduct(),
          ),
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_clean_architecture/features/showProduct/domain/entites/product.dart';

class ProductWidget extends StatelessWidget {
  ProductEntite category;

  ProductWidget({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      elevation: 2,
      child: Container(
          padding: const EdgeInsets.only(top: 15, right: 15),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: Text(
                  category.name!,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 30,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(18)),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    height: 80,
                    width: 150,
                    imageUrl: category.imageUrl ?? '',
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

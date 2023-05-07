import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_clean_architecture/core/helpers/api_helpers.dart';
import 'package:test_clean_architecture/features/showProduct/data/models/productsResponse.dart';

class ShowDataRemoteDataSource {
  @override
  static Future<ProductsResponse> getMainProduct() async {
    var url = Uri.parse(ApiHelpers.Base_Url + EndPoints.products);
    var response = await http.get(url);
    var responseBody = response.body;
    var json = jsonDecode(responseBody);
    var productResponse = ProductsResponse.fromJson(json);
    return productResponse;
  }
}

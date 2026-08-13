import 'dart:convert';

import 'package:demapp/features/products/data/models/product_model.dart';
import 'package:http/http.dart' as http;

abstract class ProductRemoteDatasource {
  Future<List<ProductModel>> getProducts();
}

class ProductRemoteDatasourceImpl implements ProductRemoteDatasource {
  final http.Client client;
  ProductRemoteDatasourceImpl({required this.client});

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await http.get(
      Uri.parse("https://dummyjson.com/products"),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);

      final List products = data["products"];
      return products.map((json) => ProductModel.fromJson(json)).toList();
    }
    throw Exception('failed to load products');
  }
}

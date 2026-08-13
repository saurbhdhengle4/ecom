import 'package:demapp/features/products/data/datasources/product_remote_datasource.dart';
import 'package:demapp/features/products/domain/entities/product.dart';
import 'package:demapp/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDatasource remoteDatasource;

  ProductRepositoryImpl({required this.remoteDatasource});

  @override
  Future<List<Product>> getProducts() async {
    return await remoteDatasource.getProducts();
  }
}

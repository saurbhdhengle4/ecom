import 'package:demapp/features/products/domain/entities/product.dart';
import 'package:demapp/features/products/domain/repositories/product_repository.dart';

class GetProductsUsecase {
  final ProductRepository productRepository;

  GetProductsUsecase(this.productRepository);
  Future<List<Product>> call() async {
    return await productRepository.getProducts();
  }
}

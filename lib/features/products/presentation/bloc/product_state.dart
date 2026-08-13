import 'package:demapp/features/products/domain/entities/product.dart';

enum ProductStatus { initial, loading, success, failure }

class ProductState {
  final ProductStatus productStatus;
  final List<Product> products;
  final String? error;
  ProductState({
    this.productStatus = ProductStatus.initial,
    this.products = const [],
    this.error,
  });

  ProductState copyWith({
    ProductStatus? productStatus,
    List<Product>? products,
    String? error,
  }) {
    return ProductState(
      productStatus: productStatus ?? this.productStatus,
      products: products ?? this.products,
      error: error ?? this.error,
    );
  }
}

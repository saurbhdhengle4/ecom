import 'package:demapp/features/products/domain/entities/product.dart';

abstract class CartEvent {
  const CartEvent();
}

class AddToCart extends CartEvent {
  final Product product;
  const AddToCart({required this.product});
}

class RemoveFromCart extends CartEvent {
  final int productId;
  const RemoveFromCart({required this.productId});
}

class IncresseQuantity extends CartEvent {
  final int productId;
  const IncresseQuantity({required this.productId});
}

class DressQuantity extends CartEvent {
  final int productId;
  const DressQuantity({required this.productId});
}

class ClearCart extends CartEvent {
  const ClearCart();
}

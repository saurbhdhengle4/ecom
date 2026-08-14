import 'package:demapp/features/cart/domain/entities/cart_item.dart';

class CartState {
  final List<CartItem> items;

  CartState({this.items = const []});

  double get totalAmount {
    return items.fold(0, (total, item) => total + item.totalPrice);
  }

  int get totalItems {
    return items.fold(0, (total, item) => total + item.quantity);
  }

  CartState copyWith({List<CartItem>? items}) {
    return CartState(items: items ?? this.items);
  }
}

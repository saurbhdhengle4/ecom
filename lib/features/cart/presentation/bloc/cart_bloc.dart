import 'package:demapp/features/cart/domain/entities/cart_item.dart';
import 'package:demapp/features/cart/presentation/bloc/cart_event.dart';
import 'package:demapp/features/cart/presentation/bloc/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState()) {
    on<AddToCart>(_addToCart);
    on<RemoveFromCart>(_removeFromCart);
    on<IncresseQuantity>(_incresseQuantity);
    on<DressQuantity>(_dressQuantity);
    on<ClearCart>(_clearCart);
  }

  void _addToCart(AddToCart event, Emitter<CartState> emit) {
    final items = List<CartItem>.from(state.items);
    final index = items.indexWhere(
      (item) => item.product.id == event.product.id,
    );
    if (index >= 0) {
      final existingItem = items[index];
      items[index] = existingItem.copyWith(
        quantity: existingItem.quantity + 1,
      ); // update qty/item
    } else {
      items.add(CartItem(product: event.product, quantity: 1)); //new item add
    }

    emit(state.copyWith(items: items));
  }

  void _removeFromCart(RemoveFromCart event, Emitter<CartState> emit) {
    final items = List<CartItem>.from(state.items);
    items.removeWhere((item) => item.product.id == event.productId);
    emit(state.copyWith(items: items));
  }

  void _incresseQuantity(IncresseQuantity event, Emitter<CartState> emit) {
    final items = List<CartItem>.from(state.items);
    final index = items.indexWhere(
      (item) => item.product.id == event.productId,
    );
    if (index >= 0) {
      final existingItem = items[index];
      items[index] = existingItem.copyWith(
        quantity: existingItem.quantity + 1,
      ); // update qty/item
    }
    emit(state.copyWith(items: items));
  }

  void _dressQuantity(DressQuantity event, Emitter<CartState> emit) {
    final items = List<CartItem>.from(state.items);
    final index = items.indexWhere(
      (item) => item.product.id == event.productId,
    );
    if (index >= 0) {
      final existingItem = items[index];

      if (existingItem.quantity > 1) {
        items[index] = existingItem.copyWith(
          quantity: existingItem.quantity - 1,
        ); // update qty/item
      } else {
        items.removeAt(index); //if zero then remove item from cart list
      }
    }
    emit(state.copyWith(items: items));
  }

  void _clearCart(ClearCart event, Emitter<CartState> emit) {
    emit(state.copyWith(items: []));
  }
}

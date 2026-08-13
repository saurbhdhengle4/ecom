import 'package:demapp/features/products/domain/usecases/get_products_usecase.dart';
import 'package:demapp/features/products/presentation/bloc/product_event.dart';
import 'package:demapp/features/products/presentation/bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductsUsecase getProductsUsecase;
  ProductBloc({required this.getProductsUsecase}) : super(ProductState()) {
    on<GetProducts>(_getProducts);
  }
  Future<void> _getProducts(
    GetProducts event,
    Emitter<ProductState> emit,
  ) async {
    emit(state.copyWith(productStatus: ProductStatus.loading));

    try {
      final products = await getProductsUsecase();
      emit(
        state.copyWith(
          productStatus: ProductStatus.success,
          products: products,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          productStatus: ProductStatus.failure,
          error: e.toString(),
        ),
      );
    }
  }
}

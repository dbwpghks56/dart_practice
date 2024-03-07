import 'package:apple_store/common/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProvider =
    NotifierProvider<RiverpodCart, List<Product>>(() => RiverpodCart());

class RiverpodCart extends Notifier<List<Product>> {
  @override
  List<Product> build() {
    return [];
  }

  /// 상품 클릭
  void onProductPressed(Product product) {
    if (state.contains(product)) {
      state.where((element) => element != product).toList();
    } else {
      state = [...state, product];
    }
  }
}

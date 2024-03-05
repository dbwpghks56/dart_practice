import 'package:apple_store/common/product.dart';
import 'package:flutter/material.dart';

class InheritedCart extends InheritedWidget {
  const InheritedCart({
    super.key,
    required super.child,
    required this.cartProductList,
    required this.onProductPressed,
  });

  /// 카트에 담긴 상품 목록
  final List<Product> cartProductList;

  /// 상품 클릭
  final void Function(Product product) onProductPressed;

  @override
  bool updateShouldNotify(InheritedCart oldWidget) {
    return true;
  }
}

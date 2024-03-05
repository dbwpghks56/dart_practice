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

  // InheritedCart.of(context) 로 손쉽게 접근하도록 만든다.
  // class 내부에 있는 static 함수는 해당 클래스의 인스턴스를 생성할 필요없이 클래스명.함수명() 으로 바로 접근할 수 있다.
  static InheritedCart of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedCart>()!;
  }
}

// Extension 을 이용해서 코드를 더 간결하게 작성할 수 있다.
extension BuildContextExt on BuildContext {
  T read<T extends InheritedWidget>() {
    return dependOnInheritedWidgetOfExactType<T>()!;
  }
}

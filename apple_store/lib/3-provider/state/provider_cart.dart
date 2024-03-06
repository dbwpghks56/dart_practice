import 'package:apple_store/common/product.dart';
import 'package:flutter/material.dart';

class ProviderCart with ChangeNotifier {
  /// 카트에 담긴 상품 목록
  List<Product> cartProductList = const [];

  /// 상품 클릭
  void onProductPressed(Product product) {
    // 새 리스트 생성
    if (cartProductList.contains(product)) {
      cartProductList =
          cartProductList.where((element) => element != product).toList();
    } else {
      cartProductList = [...cartProductList, product];
    }

    notifyListeners();
  }
}

import 'package:apple_store/2-inherited_widget/state/inherited_cart.dart';
import 'package:apple_store/common/product.dart';
import 'package:apple_store/common/product_tile.dart';
import 'package:flutter/material.dart';

class Store extends StatelessWidget {
  const Store({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // InheritedCart inheritedCart = InheritedCart.of(context);
    InheritedCart inheritedCart = context.read<InheritedCart>();
    // 변수의 타입을 지정했기 때문에 context.read로 사용 가능 ( 즉, <> 는 불필요 )

    return Scaffold(
      body: ListView.builder(
        itemCount: storeProductList.length,
        itemBuilder: (context, index) {
          Product product = storeProductList[index];
          return ProductTile(
            product: product,
            isInCart: inheritedCart.cartProductList.contains(product),
            onPressed: inheritedCart.onProductPressed,
          );
        },
      ),
    );
  }
}

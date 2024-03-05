import 'package:apple_store/2-inherited_widget/cart.dart';
import 'package:apple_store/2-inherited_widget/state/inherited_cart.dart';
import 'package:apple_store/2-inherited_widget/store.dart';
import 'package:apple_store/common/bottom_bar.dart';
import 'package:apple_store/common/product.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// 현재 선택된 index
  int currentIndex = 0;

  List<Product> cartProductList = [];

  void onProductPressed(Product product) {
    setState(() {
      // 기존의 배열을 유지하게 되면 oldWidget.cartProductList 와 비교할 때 같은 배열로 인식되어 updateShouldNotify 가 호출되지 않는다.
      if (cartProductList.contains(product)) {
        // cartProductList.remove(product);
        cartProductList =
            cartProductList.where((element) => element != product).toList();
      } else {
        // cartProductList.add(product);
        cartProductList = [...cartProductList, product];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InheritedCart(
      cartProductList: cartProductList,
      onProductPressed: onProductPressed,
      child: Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: const [
            /// Store
            Store(),

            /// Cart
            Cart(),
          ],
        ),
        bottomNavigationBar: Builder(
          builder: (context) {
            final inheritedCart = context.read<InheritedCart>();
            return BottomBar(
              currentIndex: currentIndex,
              cartTotal: "${inheritedCart.cartProductList.length}",
              onTap: (index) => setState(() {
                currentIndex = index;
              }),
            );
          },
        ),
      ),
    );
  }
}

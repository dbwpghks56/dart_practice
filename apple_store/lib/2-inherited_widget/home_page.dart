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
      if (cartProductList.contains(product)) {
        cartProductList.remove(product);
      } else {
        cartProductList.add(product);
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
        bottomNavigationBar: BottomBar(
          currentIndex: currentIndex,
          cartTotal: "0",
          onTap: (index) => setState(() {
            currentIndex = index;
          }),
        ),
      ),
    );
  }
}

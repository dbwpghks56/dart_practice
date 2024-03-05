import 'package:flutter/material.dart';

import '../common/product.dart';
import '../common/product_tile.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  final List<Product> cartProductList = const [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cartProductList.isEmpty
          ? const Center(
              child: Text(
                "Empty Cart",
                style: TextStyle(fontSize: 24, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: cartProductList.length,
              itemBuilder: (context, index) {
                Product product = cartProductList[index];
                return ProductTile(
                    product: product, isInCart: true, onPressed: (product) {});
              },
            ),
    );
  }
}

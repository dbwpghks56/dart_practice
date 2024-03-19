import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/model/cart_item.dart';
import 'package:house_of_tomorrow/src/service/cart_service.dart';
import 'package:house_of_tomorrow/src/view/cart/widget/cart_bottom_sheet.dart';
import 'package:house_of_tomorrow/src/view/cart/widget/cart_empty.dart';
import 'package:house_of_tomorrow/src/view/cart/widget/cart_item_tile.dart';
import 'package:house_of_tomorrow/theme/component/pop_button.dart';
import 'package:house_of_tomorrow/util/helper/intl_helper.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

class CartView extends ConsumerWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartData = ref.watch(cartProvider);
    final selectedCartData =
        ref.watch(cartProvider.notifier).getSelectedCartItemList();

    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.cart),
        leading: const PopButton(),
        titleSpacing: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: cartData.isEmpty
                ? const CartEmpty()
                : ListView.builder(
                    itemCount: cartData.length,
                    itemBuilder: (context, index) {
                      final CartItem cartItem = cartData[index];

                      return CartItemTile(
                        cartItem: cartItem,
                        onPressed: () {
                          ref.read(cartProvider.notifier).update(
                                index,
                                cartItem.copyWith(
                                  isSelected: !cartItem.isSelected,
                                ),
                              );
                        },
                        onCountChanged: (count) {
                          ref.read(cartProvider.notifier).update(
                                index,
                                cartItem.copyWith(
                                  count: count,
                                ),
                              );
                        },
                      );
                    },
                  ),
          ),
          CartBottomSheet(
            totalPrice: selectedCartData.isEmpty
                ? '0'
                : IntlHelper.currency(
                    symbol: selectedCartData.first.product.priceUnit,
                    number: selectedCartData.fold(0, (prev, curr) {
                      return prev + (curr.product.price * curr.count);
                    })),
            selectedCartItemList: cartData,
            onCheckOutPressed: () {},
          )
        ],
      ),
    );
  }
}

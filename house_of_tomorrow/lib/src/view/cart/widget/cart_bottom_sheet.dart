import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/model/cart_item.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/component/bottom_sheet/base_bottom_sheet.dart';
import 'package:house_of_tomorrow/theme/component/button/button.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

class CartBottomSheet extends ConsumerWidget {
  const CartBottomSheet({
    super.key,
    required this.totalPrice,
    required this.selectedCartItemList,
    required this.onCheckOutPressed,
  });

  final String totalPrice;
  final List<CartItem> selectedCartItemList;
  final void Function() onCheckOutPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = ref.watch(themeProvider);

    return BaseBottomSheet(
      padding: const EdgeInsets.only(
        top: 32,
        left: 16,
        right: 16,
        bottom: 16,
      ),
      child: Wrap(
        runSpacing: 16,
        children: [
          // Selected Item
          Row(
            children: [
              Text(
                S.current.selectedItems,
                style: themeData.typo.headline3,
              ),
              const Spacer(),
              Text(
                S.current.items(selectedCartItemList
                    .where((element) => element.isSelected)
                    .length),
                style: themeData.typo.headline3.copyWith(
                  color: themeData.color.primary,
                ),
              )
            ],
          ),
          // totalPrice
          Row(
            children: [
              Text(
                S.current.totalPrice,
                style: themeData.typo.headline3,
              ),
              const Spacer(),
              Text(
                totalPrice,
                style: themeData.typo.headline3.copyWith(
                  color: themeData.color.primary,
                ),
              )
            ],
          ),
          Button(
            onPressed: onCheckOutPressed,
            text: S.current.checkout,
            type: ButtonType.fill,
            width: double.infinity,
            size: ButtonSize.large,
            isInactive: selectedCartItemList.isEmpty,
          )
        ],
      ),
    );
  }
}

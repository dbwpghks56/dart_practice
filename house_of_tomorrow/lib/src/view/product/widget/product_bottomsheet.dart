import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:house_of_tomorrow/src/model/product.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/component/bottom_sheet/base_bottom_sheet.dart';
import 'package:house_of_tomorrow/theme/component/button/button.dart';
import 'package:house_of_tomorrow/theme/component/counter_button.dart';
import 'package:house_of_tomorrow/theme/res/layout.dart';
import 'package:house_of_tomorrow/util/helper/intl_helper.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

class ProductBottonSheet extends ConsumerWidget {
  const ProductBottonSheet({
    super.key,
    required this.count,
    required this.product,
    required this.onCountChange,
    required this.onAddtToCartPressed,
  });

  final int count;
  final Product product;
  final void Function(int count) onCountChange;
  final void Function() onAddtToCartPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = ref.watch(themeProvider);

    return BaseBottomSheet(
      isRoundAll: context.layout(false, desktop: true),
      padding: EdgeInsets.only(
        top: context.layout(32, desktop: 16),
        bottom: 16,
        left: 16,
        right: 16,
      ),
      child: Wrap(
        runSpacing: 16,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  S.current.quantity,
                  style: themeData.typo.headline3,
                ),
              ),
              CounterButton(
                count: count,
                onChanged: onCountChange,
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  S.current.totalPrice,
                  style: themeData.typo.headline3,
                ),
              ),
              Text(
                IntlHelper.currency(
                  symbol: product.priceUnit,
                  number: product.price * count,
                ),
                style: themeData.typo.headline3.copyWith(
                  color: themeData.color.primary,
                ),
              ),
            ],
          ),
          Button(
            onPressed: onAddtToCartPressed,
            width: double.infinity,
            size: ButtonSize.large,
            text: S.current.addToCart,
          ),
        ],
      ),
    );
  }
}

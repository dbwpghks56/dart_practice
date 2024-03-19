import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:house_of_tomorrow/src/model/cart_item.dart';
import 'package:house_of_tomorrow/src/model/product.dart';
import 'package:house_of_tomorrow/src/service/cart_service.dart';
import 'package:house_of_tomorrow/src/view/product/widget/product_bottomsheet.dart';
import 'package:house_of_tomorrow/src/view/product/widget/product_color_preview.dart';
import 'package:house_of_tomorrow/src/view/product/widget/product_desc.dart';
import 'package:house_of_tomorrow/theme/component/cart_button.dart';
import 'package:house_of_tomorrow/theme/component/color_picker.dart';
import 'package:house_of_tomorrow/theme/component/pop_button.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

class ProductView extends HookConsumerWidget {
  const ProductView({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var count = useState(1);

    var colorIndex = useState(0);

    void onCountChange(int newCount) {
      count.value = newCount;
    }

    void onColorIndexChange(int newColorIndex) {
      colorIndex.value = newColorIndex;
    }

    // 카트에 상품 추가
    void onAddToCartPressed() {
      final CartItem newCartItem = CartItem(
        product: product,
        count: count.value,
        colorIndex: colorIndex.value,
        isSelected: true,
      );

      ref.read(cartProvider.notifier).add(newCartItem);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.product),
        leading: const PopButton(),
        titleSpacing: 0,
        actions: const [
          CartButton(),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                vertical: 32,
              ),
              child: Wrap(
                runSpacing: 32,
                alignment: WrapAlignment.center,
                children: [
                  ProductColorPreview(
                    colorIndex: colorIndex.value,
                    product: product,
                  ),
                  ColorPicker(
                    colorIndex: colorIndex.value,
                    colorList: product.productColorList.map((e) {
                      return e.color;
                    }).toList(),
                    onColorSelected: onColorIndexChange,
                  ),
                  ProductDesc(
                    product: product,
                  ),
                ],
              ),
            ),
          ),
          ProductBottonSheet(
            count: count.value,
            product: product,
            onCountChange: onCountChange,
            onAddtToCartPressed: onAddToCartPressed,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/model/product.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/util/helper/intl_helper.dart';

class ProductColorPreview extends ConsumerWidget {
  const ProductColorPreview({
    super.key,
    required this.colorIndex,
    required this.product,
  });

  final int colorIndex;
  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = ref.watch(themeProvider);

    return Container(
      decoration: BoxDecoration(
        color: themeData.color.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: themeData.deco.shadow,
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(
        horizontal: 32,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.network(
              product.productColorList[colorIndex].imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            product.name.toString(),
            style: themeData.typo.headline1.copyWith(
              fontWeight: themeData.typo.semiBold,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                child: Text(
                  product.brand.toString(),
                  style: themeData.typo.subtitle1.copyWith(
                    fontWeight: themeData.typo.light,
                    color: themeData.color.subtext,
                  ),
                ),
              ),
              Text(
                IntlHelper.currency(
                  symbol: product.priceUnit,
                  number: product.price,
                ),
                style: themeData.typo.headline6.copyWith(
                  color: themeData.color.primary,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

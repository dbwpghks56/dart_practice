import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/model/product.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/component/rating.dart';
import 'package:house_of_tomorrow/util/helper/intl_helper.dart';

class ProductCard extends ConsumerWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = ref.watch(themeProvider);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: themeData.color.surface,
        boxShadow: themeData.deco.shadow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (product.productColorList.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                product.productColorList.first.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          const SizedBox(
            height: 4,
          ),
          Text(
            product.name.toString(),
            style: themeData.typo.headline4.copyWith(
              fontWeight: themeData.typo.semiBold,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            product.brand.toString(),
            style: themeData.typo.body2.copyWith(
              fontWeight: themeData.typo.light,
              color: themeData.color.subtext,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  IntlHelper.currency(
                    symbol: product.priceUnit,
                    number: product.price,
                  ),
                  style: themeData.typo.subtitle2,
                ),
              ),
              Rating(
                rating: product.rating,
              ),
            ],
          )
        ],
      ),
    );
  }
}

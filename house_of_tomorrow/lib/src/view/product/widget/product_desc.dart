import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:house_of_tomorrow/src/model/product.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/component/rating.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

class ProductDesc extends ConsumerWidget {
  const ProductDesc({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = ref.watch(themeProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  S.current.description,
                  style: themeData.typo.headline4.copyWith(
                    fontWeight: themeData.typo.semiBold,
                    color: themeData.color.text,
                  ),
                ),
              ),
              Rating(
                rating: product.rating,
              )
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            product.description.toString(),
            style: themeData.typo.headline6.copyWith(
              color: themeData.color.subtext,
              fontWeight: themeData.typo.regular,
            ),
          ),
        ],
      ),
    );
  }
}

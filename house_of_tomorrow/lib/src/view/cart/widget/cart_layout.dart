import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/res/layout.dart';

class CartLayout extends ConsumerWidget {
  const CartLayout({
    super.key,
    required this.cartItemList,
    required this.cartBottomSheet,
  });

  final Widget cartItemList;
  final Widget cartBottomSheet;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = ref.watch(themeProvider);

    return context.layout(
      Column(
        children: [
          Expanded(
            child: cartItemList,
          ),
          cartBottomSheet,
        ],
      ),
      desktop: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 32,
          horizontal: 16.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: themeData.color.surface,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: themeData.deco.shadow,
                ),
                child: cartItemList,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: cartBottomSheet,
            ),
          ],
        ),
      ),
    );
  }
}

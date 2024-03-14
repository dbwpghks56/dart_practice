import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

class ProductEmpty extends ConsumerWidget {
  const ProductEmpty({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = ref.watch(themeProvider);

    return Center(
      child: Text(
        S.current.noProduct,
        style: themeData.typo.headline4.copyWith(
          fontWeight: themeData.typo.light,
          color: themeData.color.inactive,
        ),
      ),
    );
  }
}

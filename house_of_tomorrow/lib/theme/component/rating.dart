import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/component/asset_icon.dart';

class Rating extends ConsumerWidget {
  const Rating({
    super.key,
    required this.rating,
  });

  final String rating;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = ref.watch(themeProvider);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AssetIcon(
          'star',
          color: themeData.color.tertiary,
          size: 20,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          rating,
          style: themeData.typo.body1.copyWith(
            fontWeight: themeData.typo.light,
            color: themeData.color.subtext,
          ),
        )
      ],
    );
  }
}

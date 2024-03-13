import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/component/asset_icon.dart';

class Tile extends ConsumerWidget {
  const Tile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  });

  final String icon;
  final String title;
  final String subtitle;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = ref.watch(themeProvider);

    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.translucent, // 투명한 영역도 탭 가능하도록 설정
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // start icon
            AssetIcon(
              icon,
            ),
            const SizedBox(
              width: 8,
            ),
            // title
            Expanded(
              child: Text(
                title,
                style: themeData.typo.headline5,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            // subtitle
            Text(
              subtitle,
              style: themeData.typo.subtitle1.copyWith(
                color: themeData.color.primary,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            // end icon
            const AssetIcon(
              'chevron-right',
            ),
          ],
        ),
      ),
    );
  }
}

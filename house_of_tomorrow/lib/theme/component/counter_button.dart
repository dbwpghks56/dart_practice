import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/component/asset_icon.dart';

class CounterButton extends ConsumerWidget {
  const CounterButton({
    super.key,
    required this.count,
    required this.onChanged,
  });

  final int count;
  final void Function(int newCount) onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = ref.watch(themeProvider);
    bool isMinusActive = count > 1;

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 16,
      children: [
        GestureDetector(
          onTap: () {
            if (!isMinusActive) return;
            onChanged(count - 1);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 222),
            decoration: BoxDecoration(
              color: themeData.color.surface,
              boxShadow: isMinusActive ? themeData.deco.shadow : null,
              borderRadius: BorderRadius.circular(99),
            ),
            padding: const EdgeInsets.all(8),
            child: AssetIcon(
              "minus",
              color: isMinusActive
                  ? themeData.color.primary
                  : themeData.color.inactive,
            ),
          ),
        ),
        Text(
          "$count",
          style: themeData.typo.headline4.copyWith(
            fontWeight: themeData.typo.semiBold,
          ),
        ),
        GestureDetector(
          onTap: () {
            onChanged(count + 1);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 222),
            decoration: BoxDecoration(
              color: themeData.color.surface,
              boxShadow: themeData.deco.shadow,
              borderRadius: BorderRadius.circular(99),
            ),
            padding: const EdgeInsets.all(8),
            child: AssetIcon(
              "plus",
              color: themeData.color.primary,
            ),
          ),
        ),
      ],
    );
  }
}

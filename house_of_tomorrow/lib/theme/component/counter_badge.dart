import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';

class CounterBadge extends ConsumerWidget {
  const CounterBadge({
    super.key,
    required this.child,
    required this.label,
    required this.isShow,
  });

  final Widget child;
  final String label;
  final bool isShow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = ref.watch(themeProvider);

    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          top: 10,
          right: 6,
          child: CircleAvatar(
            backgroundColor: themeData.color.secondary,
            radius: isShow ? 10 : 0,
            child: Text(
              label,
              style: themeData.typo.body2.copyWith(
                color: themeData.color.onSecondary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

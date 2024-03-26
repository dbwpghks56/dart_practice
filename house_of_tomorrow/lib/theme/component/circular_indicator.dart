import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';

class CircularIndicator extends ConsumerWidget {
  const CircularIndicator({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = ref.watch(themeProvider);

    return Stack(
      children: [
        child,
        Container(
          color: themeData.color.background,
          alignment: Alignment.center,
          child: CircularProgressIndicator(
            color: themeData.color.primary,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';

class ToastBuilder extends ConsumerWidget {
  const ToastBuilder({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = ref.watch(themeProvider);

    final Size screenSize = MediaQuery.of(context).size;

    return Positioned(
      bottom: screenSize.height * 0.25,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: themeData.color.toastContainer,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          child: DefaultTextStyle(
            style: themeData.typo.headline6.copyWith(
              color: themeData.color.onToastContainer,
            ),
            child: Text(
              text,
            ),
          ),
        ),
      ),
    );
  }
}

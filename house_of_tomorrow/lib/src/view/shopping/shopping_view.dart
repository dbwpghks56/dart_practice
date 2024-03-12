import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/foundation/app_theme.dart';

class ShoppingView extends ConsumerWidget {
  const ShoppingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppTheme theme = ref.watch(themeProvider);

    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: ref.read(themeProvider.notifier).toggleTheme,
          child: Text(
            "Toggle Theme",
            style: theme.typo.headline6,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/component/button/button.dart';

class PopButton extends ConsumerWidget {
  const PopButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = ref.watch(themeProvider);

    return Button(
      onPressed: () => Navigator.pop(context),
      icon: 'arrow-left',
      color: themeData.color.text,
      type: ButtonType.flat,
    );
  }
}

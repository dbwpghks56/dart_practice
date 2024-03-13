import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/service/lang_service.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/component/bottom_sheet/setting_bottom_sheet.dart';
import 'package:house_of_tomorrow/theme/component/button/button.dart';
import 'package:house_of_tomorrow/theme/foundation/app_theme.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

class ShoppingView extends ConsumerWidget {
  const ShoppingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppTheme theme = ref.watch(themeProvider);
    Locale localeData = ref.watch(langProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.current.shopping,
        ),
        actions: [
          // 설정 버튼
          Button(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const SettingBottomSheet();
                },
              );
            },
            icon: 'option',
            type: ButtonType.flat,
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: ref.read(themeProvider.notifier).toggleTheme,
              child: Text(
                "Toggle Theme",
                style: theme.typo.headline6,
              ),
            ),
            TextButton(
              onPressed: ref.read(langProvider.notifier).toggleLang,
              child: Text(
                "Toggle Locale",
                style: theme.typo.headline6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

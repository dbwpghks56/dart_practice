import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/component/base_dialog.dart';
import 'package:house_of_tomorrow/theme/component/button/button.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

class CartCheckoutDialog extends ConsumerWidget {
  const CartCheckoutDialog({
    super.key,
    required this.onCheckoutPressed,
  });

  final void Function() onCheckoutPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = ref.watch(themeProvider);

    return BaseDialog(
      title: S.current.checkout,
      content: Text(
        S.current.checkoutDialogDesc,
        style: themeData.typo.headline6,
      ),
      actions: [
        Button(
          text: S.current.checkout,
          width: double.infinity,
          color: themeData.color.onPrimary,
          backgroundColor: themeData.color.primary,
          onPressed: () {
            Navigator.pop(context);
            onCheckoutPressed();
          },
        ),
        const SizedBox(height: 12),
        Button(
          text: S.current.cancel,
          width: double.infinity,
          color: themeData.color.text,
          borderColor: themeData.color.hint,
          onPressed: () {
            Navigator.pop(context);
          },
          type: ButtonType.outline,
        ),
      ],
    );
  }
}

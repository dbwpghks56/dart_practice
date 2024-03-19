import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/component/base_dialog.dart';
import 'package:house_of_tomorrow/theme/component/button/button.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

class CartDeleteDialog extends ConsumerWidget {
  const CartDeleteDialog({
    super.key,
    required this.onDeletePressed,
  });

  final void Function() onDeletePressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = ref.watch(themeProvider);

    return BaseDialog(
      title: S.current.delete,
      content: Text(
        S.current.deleteDialogDesc,
        style: themeData.typo.headline6,
      ),
      actions: [
        Button(
          text: S.current.delete,
          width: double.infinity,
          color: themeData.color.onSecondary,
          backgroundColor: themeData.color.secondary,
          onPressed: () {
            Navigator.pop(context);
            onDeletePressed();
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

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:house_of_tomorrow/src/repository/product_repository.dart';
import 'package:house_of_tomorrow/src/service/lang_service.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/src/view/shopping/widget/product_card_grid.dart';
import 'package:house_of_tomorrow/src/view/shopping/widget/product_empty.dart';
import 'package:house_of_tomorrow/theme/component/bottom_sheet/setting_bottom_sheet.dart';
import 'package:house_of_tomorrow/theme/component/button/button.dart';
import 'package:house_of_tomorrow/theme/component/cart_button.dart';
import 'package:house_of_tomorrow/theme/component/hide_keyboard.dart';
import 'package:house_of_tomorrow/theme/component/input_field.dart';
import 'package:house_of_tomorrow/theme/foundation/app_theme.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

const String PRODUCTURL =
    "https://gist.githubusercontent.com/nero-angela/d16a5078c7959bf5abf6a9e0f8c2851a/raw/04fb4d21ddd1ba06f0349a890f5e5347d94d677e/ikeaSofaDataIBB.json";

class ShoppingView extends HookConsumerWidget {
  const ShoppingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppTheme theme = ref.watch(themeProvider);
    Locale localeData = ref.watch(langProvider);

    final textEditing = useTextEditingController();
    String getSearchText() => textEditing.text.trim();

    final productListAsyncValue = ref.watch(findProductList(getSearchText()));

    return HideKeyboard(
      child: Scaffold(
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
            ),
            const CartButton(),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InputField(
                      hint: S.current.searchProduct,
                      controller: textEditing,
                      onClear: () =>
                          ref.watch(findProductList(getSearchText())),
                      onSubmitted: (text) =>
                          ref.watch(// ref.refresh()를 사용하여 상태를 갱신합니다.
                              findProductList(getSearchText())),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Button(
                    icon: 'search',
                    onPressed: () =>
                        ref.watch(findProductList(getSearchText())),
                  ),
                ],
              ),
            ),
            Expanded(
              child: productListAsyncValue.when(
                data: (value) {
                  return ProductCardGrid(
                    productList: value,
                  );
                },
                error: (error, stackTrace) {
                  return const ProductEmpty();
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

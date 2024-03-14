import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:house_of_tomorrow/src/model/product.dart';
import 'package:house_of_tomorrow/src/service/lang_service.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/component/bottom_sheet/setting_bottom_sheet.dart';
import 'package:house_of_tomorrow/theme/component/button/button.dart';
import 'package:house_of_tomorrow/theme/component/input_field.dart';
import 'package:house_of_tomorrow/theme/foundation/app_theme.dart';
import 'package:house_of_tomorrow/util/helper/network_helper.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

const String PRODUCTURL =
    "https://gist.githubusercontent.com/nero-angela/d16a5078c7959bf5abf6a9e0f8c2851a/raw/04fb4d21ddd1ba06f0349a890f5e5347d94d677e/ikeaSofaDataIBB.json";

class ShoppingView extends HookConsumerWidget {
  const ShoppingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppTheme theme = ref.watch(themeProvider);
    Locale localeData = ref.watch(langProvider);
    var productList = useState([]);

    Future<void> searchProductList() async {
      try {
        final res = await NetworkHelper.dio.get(PRODUCTURL);

        productList.value = jsonDecode(res.data).map<Product>((json) {
          return Product.fromJson(json);
        }).toList();
      } catch (e, s) {
        log('Failed to fetch product list', error: e, stackTrace: s);
      }
    }

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
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Button(
                  icon: 'search',
                  onPressed: searchProductList,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

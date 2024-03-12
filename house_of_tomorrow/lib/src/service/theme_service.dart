import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/theme/dark_theme.dart';
import 'package:house_of_tomorrow/theme/foundation/app_theme.dart';
import 'package:house_of_tomorrow/theme/light_theme.dart';

final themeProvider =
    NotifierProvider<RiverpodTheme, AppTheme>(RiverpodTheme.new);

class RiverpodTheme extends Notifier<AppTheme> {
  @override
  AppTheme build() {
    return LightTheme();
  }

  // 테마 변경
  void toggleTheme() {
    if (state.brightness == Brightness.light) {
      state = DarkTheme();
    } else {
      state = LightTheme();
    }
  }
}

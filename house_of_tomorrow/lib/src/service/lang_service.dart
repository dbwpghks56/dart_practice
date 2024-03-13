import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/util/helper/intl_helper.dart';

final langProvider = NotifierProvider<RiverpodLang, Locale>(RiverpodLang.new);

class RiverpodLang extends Notifier<Locale> {
  @override
  Locale build() {
    return IntlHelper.en;
  }

  void toggleLang() {
    state = IntlHelper.isKo ? IntlHelper.en : IntlHelper.ko;
  }
}

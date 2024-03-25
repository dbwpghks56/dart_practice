import 'package:flutter_riverpod/flutter_riverpod.dart';

final baseProvider = NotifierProvider<BaseViewModel, bool>(BaseViewModel.new);

class BaseViewModel extends Notifier<bool> {
  @override
  build() {
    return false;
  }

  void isLoading(bool value) {
    state = value;
  }
}

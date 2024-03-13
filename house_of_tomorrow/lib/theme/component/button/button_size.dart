part of 'button.dart';

enum ButtonSize {
  small,
  medium,
  large;

  double get padding {
    switch (this) {
      case ButtonSize.small:
        return 8;
      case ButtonSize.medium:
        return 12;
      case ButtonSize.large:
        return 16;
    }
  }

  TextStyle getTextStyle(WidgetRef ref) {
    final themeData = ref.watch(themeProvider);

    switch (this) {
      case ButtonSize.small:
        return themeData.typo.subtitle2;
      case ButtonSize.medium:
        return themeData.typo.subtitle1;
      case ButtonSize.large:
        return themeData.typo.headline6;
    }
  }
}

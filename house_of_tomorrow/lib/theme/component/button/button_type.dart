part of 'button.dart';

enum ButtonType {
  fill,
  flat,
  outline;

  // 텍스트 & 아이콘 색상
  Color getColor(
    WidgetRef ref,
    bool isInactive, [
    // 선택적 위치 매개변수
    Color? color,
  ]) {
    final themeData = ref.watch(themeProvider);

    switch (this) {
      case ButtonType.fill:
        return isInactive
            ? themeData.color.onInactiveContainer
            : color ?? themeData.color.onPrimary;
      case ButtonType.flat:
      case ButtonType.outline:
        return isInactive
            ? themeData.color.inactive
            : color ?? themeData.color.primary;
    }
  }

  // 배경 색상
  Color getBackgroundColor(
    WidgetRef ref,
    bool isInactive, [
    // 선택적 위치 매개변수
    Color? color,
  ]) {
    final themeData = ref.watch(themeProvider);

    switch (this) {
      case ButtonType.fill:
        return isInactive
            ? themeData.color.inactiveContainer
            : color ?? themeData.color.primary;
      case ButtonType.flat:
      case ButtonType.outline:
        return color ?? Colors.transparent; // 투명색
    }
  }

  // 테두리 색상
  Border? getBorder(
    WidgetRef ref,
    bool isInactive, [
    // 선택적 위치 매개변수
    Color? color,
  ]) {
    switch (this) {
      case ButtonType.fill:
      case ButtonType.flat:
        return null;
      case ButtonType.outline:
        return Border.all(
          color: getColor(ref, isInactive, color),
        );
    }
  }
}

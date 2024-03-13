import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/component/asset_icon.dart';

part 'button_size.dart';
part 'button_type.dart';

class Button extends ConsumerStatefulWidget {
  const Button({
    super.key,
    required this.onPressed,
    ButtonType? type,
    ButtonSize? size,
    bool? isInactive,
    this.text,
    this.icon,
    this.width,
    this.color,
    this.backgroundColor,
    this.borderColor,
  })  : type = type ?? ButtonType.fill,
        size = size ?? ButtonSize.medium,
        isInactive = isInactive ?? false;

  // 클릭 이벤트
  final void Function() onPressed;
  final ButtonType type;
  final ButtonSize size;

  // 비활성화 여부
  final bool isInactive;

  // 텍스트 & 아이콘
  final String? text;
  final String? icon;

  // 폭
  final double? width;

  // 커스텀 색상
  final Color? color;
  final Color? backgroundColor;
  final Color? borderColor;

  @override
  ConsumerState<Button> createState() => _ButtonState();
}

class _ButtonState extends ConsumerState<Button> {
  bool isPressed = false;

  bool get isInactive => isPressed || widget.isInactive;

  Color get color => widget.type.getColor(
        ref,
        isInactive,
        widget.color,
      );

  Color get backgroundColor => widget.type.getBackgroundColor(
        ref,
        isInactive,
        widget.backgroundColor,
      );

  Border? get border => widget.type.getBorder(
        ref,
        isInactive,
        widget.borderColor,
      );

  void onPressed(bool newIsPressed) {
    if (isPressed == newIsPressed) return;
    setState(() {
      isPressed = newIsPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (details) {
        onPressed(false);
        if (!widget.isInactive) {
          widget.onPressed();
        }
      },
      onTapDown: (details) => onPressed(true),
      onTapCancel: () => onPressed(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: widget.width,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: border,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(widget.size.padding),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon
            if (widget.icon != null)
              AssetIcon(
                widget.icon!,
                color: color,
              ),
            if (widget.icon != null && widget.text != null)
              const SizedBox(width: 8),
            // Text
            if (widget.text != null)
              Text(
                widget.text!,
                style: widget.size.getTextStyle(ref).copyWith(
                      color: color,
                      fontWeight: ref.watch(themeProvider).typo.semiBold,
                    ),
              ),
          ],
        ),
      ),
    );
  }
}

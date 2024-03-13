import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/component/button/button.dart';

class InputField extends ConsumerStatefulWidget {
  const InputField({
    super.key,
    this.hint,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
  });

  final String? hint;
  final TextEditingController? controller;
  final void Function(String text)? onChanged;
  final void Function(String text)? onSubmitted;
  final void Function()? onClear;

  @override
  ConsumerState<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends ConsumerState<InputField> {
  late final TextEditingController _controller =
      widget.controller ?? TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeData = ref.watch(themeProvider);

    return TextField(
      controller: _controller,
      onChanged: (value) {
        widget.onChanged?.call(value);
        setState(() {});
      },
      onSubmitted: widget.onSubmitted,
      style: themeData.typo.headline5,
      cursorColor: themeData.color.primary,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: themeData.color.hintContainer,
        hintText: widget.hint,
        hintStyle: themeData.typo.headline5.copyWith(
          fontWeight: themeData.typo.light,
          color: themeData.color.onHintContainer,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 11.5,
        ),
        suffixIcon: _controller.text.isEmpty
            ? null
            : Button(
                icon: 'close',
                onPressed: () {
                  setState(() {
                    _controller.clear();
                    widget.onClear?.call();
                  });
                },
                type: ButtonType.flat,
              ),
      ),
    );
  }
}

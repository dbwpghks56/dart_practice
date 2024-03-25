import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/view/base_view_model.dart';

class BaseView<T extends BaseViewModel> extends ConsumerWidget {
  const BaseView({
    super.key,
    required this.viewModel,
    required this.builder,
  });

  final T viewModel;
  final Widget Function(BuildContext context, T viewModel) builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [
        baseProvider.overrideWith(() => viewModel),
      ],
      child: builder(context, viewModel),
    );
  }
}

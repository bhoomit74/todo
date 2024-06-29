import 'package:flutter/material.dart';
import 'package:todo/presentation/styles/styles.dart';
import 'package:todo/presentation/utils/helper/helpers.dart';
import 'package:todo/presentation/widgets/app_text_field.dart';

class AppSearchBar extends StatefulWidget {
  final String hint;
  final Function(String query) onSearch;
  const AppSearchBar({super.key, required this.hint, required this.onSearch});

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  final Debouncer _debouncer =
      Debouncer(interval: AppConstants.debounceInterval);

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      hint: widget.hint,
      focusedBorderColor: AppColors.primary,
      prefixIcon: Padding(
        padding: AppConstants.paddingH16,
        child: Image.asset(AppImages.search, height: 24, width: 24),
      ),
      onChanged: (value) {
        _debouncer.run(() => widget.onSearch(value));
      },
    );
  }
}

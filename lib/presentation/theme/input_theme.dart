import 'package:clean_arch_rock_n_roll/presentation/helpers/helpers.dart';
import 'package:clean_arch_rock_n_roll/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class AppInputDecorationTheme {
  static const gray = AppColors.grey;

  static final inputDecoration = InputDecorationTheme(
    hintStyle: AppTextTheme.textTheme.bodyMedium?.copyWith(color: gray),
    contentPadding: Responsive.isMobile
        ? const EdgeInsets.symmetric(horizontal: 18, vertical: 14)
        : const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
    border: InputHelper.inputStyle(AppColors.grey),
    enabledBorder: InputHelper.inputStyle(AppColors.grey),
    focusedBorder: InputHelper.inputStyle(AppColors.grey),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    isDense: true,
  );
}
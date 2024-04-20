import 'package:clean_arch_rock_n_roll/data/const/constants.dart';
import 'package:clean_arch_rock_n_roll/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

import 'app_color_scheme.dart';

class AppTheme {
  static final theme = ThemeData(
    fontFamily: Constants.fontFamily,
    textTheme: AppTextTheme.textTheme,
    colorScheme: AppColorScheme.dark,
    inputDecorationTheme: AppInputDecorationTheme.inputDecoration,
    scaffoldBackgroundColor: AppColorScheme.dark.background,
    useMaterial3: true,
  );
}
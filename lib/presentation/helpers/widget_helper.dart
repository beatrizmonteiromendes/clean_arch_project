import 'package:clean_arch_rock_n_roll/presentation/theme/theme.dart';
import 'package:flutter/material.dart';


class WidgetHelper {
  static Widget error(String text) {
    return Container(
      width: double.infinity,
      height: 200,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppTextTheme.textTheme.bodyLarge?.copyWith(
          color: AppColors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
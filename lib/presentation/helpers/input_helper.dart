import 'package:clean_arch_rock_n_roll/presentation/helpers/helpers.dart';
import 'package:flutter/material.dart';


class InputHelper {
  static inputStyle(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: 1.2,
      ),
      borderRadius: BorderRadius.circular(
        Responsive.isMobile ? 10 : 12,
      ),
    );
  }
}
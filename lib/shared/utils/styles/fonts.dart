import 'package:arnoldgym/shared/utils/styles/colors.dart';
import 'package:flutter/material.dart';
//import 'app_colors.dart';

class AppTextStyles {
  static const TextStyle heading1 = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.bold,
    color: AppColors.textSecondary,
    fontStyle: FontStyle.italic,
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 44,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    fontStyle: FontStyle.italic,
  );

  static const TextStyle body1 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle button1 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );
}

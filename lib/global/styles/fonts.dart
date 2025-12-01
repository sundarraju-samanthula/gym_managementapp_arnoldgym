//import 'package:arnoldgym/shared/utils/styles/colors.dart';
//import 'package:arnoldgym/shared/utils/styles%20copy/colors.dart';
import 'package:arnoldgym/global/styles/colors.dart';
import 'package:flutter/material.dart';
//import 'app_colors.dart';

class AppTextStyles {
  static const TextStyle heading1 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: Colors.white,
    fontFamily: 'Poppins',
  );

  static const TextStyle heading2 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 40,
    color: Colors.white,
    fontStyle: FontStyle.italic,
    fontFamily: "BarlowSemiCondensed",
  );

  static const TextStyle heading3 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 45,
    color: Color.fromRGBO(184, 254, 34, 1),
    fontStyle: FontStyle.italic,
    fontFamily: "BarlowSemiCondensed",
  );

  static const TextStyle body1 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle button1 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: Colors.black,

    fontFamily: 'Poppins',
  );
  static const TextStyle heading4 = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: 'Poppins',
  );
}

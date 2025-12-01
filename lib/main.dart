import 'package:arnoldgym/controllers/Auth_binding.dart';
import 'package:arnoldgym/global/styles/colors.dart';
import 'package:arnoldgym/global/styles/fonts.dart';
//import 'package:arnoldgym/shared/utils/styles%20copy/colors.dart';
//import 'package:arnoldgym/shared/utils/styles%20copy/fonts.dart';
// import 'package:arnoldgym/shared/utils/styles/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Your App',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: AppColors.accent,
        ),
        textTheme: TextTheme(
          headlineLarge: AppTextStyles.heading1,
          headlineMedium: AppTextStyles.heading2,
          headlineSmall: AppTextStyles.heading3,

          bodyMedium: AppTextStyles.body1,
          bodyLarge: AppTextStyles.button1,
        ),
      ),
      initialBinding: AuthBinding(),
      initialRoute: AppRoutes.splash,
      getPages: AppRoutes.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}

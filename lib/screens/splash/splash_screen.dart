
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _decideNavigation();
  }

  Future<void> _decideNavigation() async {
    await Future.delayed(const Duration(milliseconds: 800)); 

    final prefs = await SharedPreferences.getInstance();
    final bool hasOnboarded = prefs.getBool('hasOnboarded') ?? false;
    final bool profileDone = prefs.getBool('profileCompleted') ?? false;

    print('DEBUG: hasOnboarded = $hasOnboarded, profileCompleted = $profileDone');

    if (!hasOnboarded) {
      Get.offAllNamed(AppRoutes.onboarding);
    } else if (!profileDone) {
      Get.offAllNamed(AppRoutes.basicProfile);
    } else {
      Get.offAllNamed(AppRoutes.dashboard);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

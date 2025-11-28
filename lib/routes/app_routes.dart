import 'package:arnoldgym/screens/onboarding/onboarding.dart';
import 'package:get/get.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/profile/basic_profile_screen.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../controllers/basic_profile_controller.dart';

class AppRoutes {
  static const splash = '/';
  static const onboarding = '/onboarding';
  static const basicProfile = '/basic-profile';
  static const dashboard = '/dashboard';

  static List<GetPage> pages = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: onboarding, page: () => OnboardingScreen()),
    GetPage(
      name: basicProfile,
      page: () => BasicProfileScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<BasicProfileController>(() => BasicProfileController());
      }),
    ),
    GetPage(name: dashboard, page: () => DashboardScreen()),
  ];
}

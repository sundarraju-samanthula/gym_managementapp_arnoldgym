import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:arnoldgym/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final userProvider = context.read<UserProvider>();
    // final loginUser = userProvider.getLoginUsr();

    return AnimatedSplashScreen(
      // Full screen GIF configuration
      splash: Image.asset(
        "assets/arnoldgymsplash.gif",
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (context, error, stackTrace) {
          // Fallback UI if GIF fails to load
          return Container(
            color: const Color.fromARGB(255, 0, 0, 0), // Your brand color
            child: const Center(
              child: Icon(Icons.apps_rounded, color: Colors.white, size: 64),
            ),
          );
        },
      ),
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.white, // Set your desired background color
      nextScreen: LoginPage(),
      splashIconSize: double.infinity, // Ensures full screen coverage
      animationDuration: const Duration(milliseconds: 1500),
      pageTransitionType: PageTransitionType.fade,
    );
  }
}

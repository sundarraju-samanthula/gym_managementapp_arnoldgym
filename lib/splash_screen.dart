// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:arnoldgym/login_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:page_transition/page_transition.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // final userProvider = context.read<UserProvider>();
//     // final loginUser = userProvider.getLoginUsr();

//     return AnimatedSplashScreen(
//       // Full screen GIF configuration
//       splash: Image.asset(
//         "assets/arnoldgymsplash.gif",
//         fit: BoxFit.cover,
//         width: double.infinity,
//         height: double.infinity,
//         errorBuilder: (context, error, stackTrace) {
//           // Fallback UI if GIF fails to load
//           return Container(
//             color: const Color.fromARGB(255, 0, 0, 0), // Your brand color
//             child: const Center(
//               child: Icon(Icons.apps_rounded, color: Colors.white, size: 64),
//             ),
//           );
//         },
//       ),
//       duration: 3000,
//       splashTransition: SplashTransition.fadeTransition,
//       backgroundColor: Colors.white, // Set your desired background color
//       nextScreen: LoginPage(),
//       splashIconSize: double.infinity, // Ensures full screen coverage
//       animationDuration: const Duration(milliseconds: 1500),
//       pageTransitionType: PageTransitionType.fade,
//     );
//   }
// }
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:arnoldgym/auth_rename.dart';
import 'package:arnoldgym/login_screen.dart';
import 'package:arnoldgym/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _navigateUser(),
      builder: (context, snapshot) {
        return AnimatedSplashScreen(
          splash: Image.asset(
            "assets/arnoldgymsplash.gif",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.black,
                child: const Center(
                  child: Icon(
                    Icons.apps_rounded,
                    color: Colors.white,
                    size: 64,
                  ),
                ),
              );
            },
          ),
          duration: 3000,
          backgroundColor: Colors.white,
          splashTransition: SplashTransition.fadeTransition,
          splashIconSize: double.infinity,
          animationDuration: const Duration(milliseconds: 1500),
          pageTransitionType: PageTransitionType.fade,

          nextScreen: snapshot.data == true
              ? const HomeScreen()
              : const AuthWrapper(),
        );
      },
    );
  }

  Future<bool> _navigateUser() async {
    await Future.delayed(const Duration(milliseconds: 500));

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      return true; //
    } else {
      return false;
    }
  }
}

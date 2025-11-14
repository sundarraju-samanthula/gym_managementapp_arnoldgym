// // import 'package:flutter/material.dart';

// // class LoginScreen extends StatefulWidget {
// //   const LoginScreen({super.key});

// //   @override
// //   State<LoginScreen> createState() => _LoginScreenState();
// // }

// // class _LoginScreenState extends State<LoginScreen> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Container(
// //         child: Title(color: Colors.black, child: Text("googlesignin")),
// //       ),
// //     );
// //   }
// // }
import 'package:arnoldgym/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<UserCredential?> login() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () async {
            final UserCredential = await login();
            if (UserCredential != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => HomeScreen()),
              );
            }
          },
          child: Text("Google login"),
        ),
      ),
    );
  }
}
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   // This is the function with the fix for the Google Sign-In error.
//   Future<UserCredential?> login() async {
//     try {
//       // FIX: The GoogleSignIn().signIn() is the correct way.
//       // It creates an instance of GoogleSignIn() and calls the signIn() method on it.
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//       if (googleUser == null) {
//         // User cancelled the sign-in
//         return null;
//       }

//       // 1. Get the authentication details from the Google user
//       final GoogleSignInAuthentication googleAuth =
//           await googleUser.authentication;

//       // 2. Create a Firebase credential using the tokens
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       // 3. Sign in to Firebase with the credential
//       return await FirebaseAuth.instance.signInWithCredential(credential);
//     } catch (e) {
//       // Handle potential errors (e.g., network issues, configuration errors)
//       print("Google Sign-In Error: $e");
//       return null;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Google Sign-In')),
//       body: Center(
//         child: InkWell(
//           onTap: () async {
//             final userCredential = await login();
//             if (userCredential != null) {
//               // Handle successful login, e.g., navigate to home screen
//               print(
//                 "User successfully logged in: ${userCredential.user?.displayName}",
//               );
//               // You would typically navigate here:
//               // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
//             } else {
//               // Handle failed or cancelled login
//               print("Login failed or cancelled.");
//             }
//           },
//           child: Container(
//             padding: const EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: Colors.blue,
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: const Text(
//               "Google Login",
//               style: TextStyle(color: Colors.white, fontSize: 18),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

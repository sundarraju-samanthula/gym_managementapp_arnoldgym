// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import '../../controllers/auth_controller.dart';
// // import '../../routes/app_routes.dart';

// // class DashboardScreen extends StatelessWidget {
// //   final AuthController _authController = Get.find<AuthController>();

// //   DashboardScreen({Key? key}) : super(key: key);

// //   void _onLogout() {
// //     _authController.logout();

// //     Get.offAllNamed(AppRoutes.onboarding);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("Dashboard"),
// //         centerTitle: true,
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.logout),
// //             tooltip: "Logout",
// //             onPressed: _onLogout,
// //           ),
// //         ],
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Obx(() {
// //           final uid = _authController.userID.value;
// //           final accCreated = _authController.accCreated.value;

// //           return Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Text(
// //                 "Welcome, Manager!",
// //                 style: Theme.of(context).textTheme.headlineSmall,
// //               ),
// //               const SizedBox(height: 20),
// //               Card(
// //                 elevation: 4,
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(8),
// //                 ),
// //                 child: ListTile(
// //                   leading: const Icon(Icons.person, size: 40),
// //                   title: Text("User ID"),
// //                   subtitle: Text(uid.isNotEmpty ? uid : "—"),
// //                 ),
// //               ),
// //               const SizedBox(height: 12),
// //               Card(
// //                 elevation: 4,
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(8),
// //                 ),
// //                 child: ListTile(
// //                   leading: const Icon(Icons.verified_user, size: 40),
// //                   title: const Text("Role"),
// //                   subtitle: const Text("Manager"),
// //                 ),
// //               ),
// //               const SizedBox(height: 12),
// //               Card(
// //                 elevation: 4,
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(8),
// //                 ),
// //                 child: ListTile(
// //                   leading: const Icon(Icons.check_circle, size: 40),
// //                   title: const Text("Profile Created"),
// //                   subtitle: Text(accCreated == 1 ? "Yes" : "No"),
// //                 ),
// //               ),
// //               const Spacer(),
// //               SizedBox(
// //                 width: double.infinity,
// //                 child: ElevatedButton.icon(
// //                   onPressed: _onLogout,
// //                   icon: const Icon(Icons.exit_to_app),
// //                   label: const Text("Log Out"),
// //                   style: ElevatedButton.styleFrom(
// //                     padding: const EdgeInsets.symmetric(vertical: 14),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           );
// //         }),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../routes/app_routes.dart';

// class DashboardScreen extends StatelessWidget {
//   DashboardScreen({Key? key}) : super(key: key);

//   void _onLogout() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.clear();
//     Get.offAllNamed(AppRoutes.onboarding);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Dashboard'),
//         centerTitle: true,
//         actions: [
//           IconButton(icon: const Icon(Icons.logout), onPressed: _onLogout),
//         ],
//       ),
//       body: Center(
//         child: Text(
//           'You are on dashboard now ☺️',
//           style: Theme.of(context).textTheme.headlineMedium,
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controllers/auth_controller.dart';
import '../../routes/app_routes.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);

  final AuthController _authController = Get.find<AuthController>();

  Future<void> _onLogout() async {
    // Clear stored onboarding & profile flags + (optionally) auth tokens
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    // navigate to onboarding (fresh start)
    Get.offAllNamed(AppRoutes.onboarding);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.logout), onPressed: _onLogout),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() {
          final uid = _authController.userID.value;
          final accCreated = _authController.accCreated.value;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to Dashboard',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 4,
                child: ListTile(
                  leading: const Icon(Icons.person, size: 40),
                  title: const Text('User ID'),
                  subtitle: Text(uid.isNotEmpty ? uid : '—'),
                ),
              ),
              const SizedBox(height: 12),
              Card(
                elevation: 4,
                child: ListTile(
                  leading: const Icon(Icons.verified_user, size: 40),
                  title: const Text('Role'),
                  subtitle: const Text('Manager'),
                ),
              ),
              const SizedBox(height: 12),
              Card(
                elevation: 4,
                child: ListTile(
                  leading: const Icon(Icons.check_circle, size: 40),
                  title: const Text('Profile Created'),
                  subtitle: Text(accCreated == 1 ? 'Yes' : 'No'),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.exit_to_app),
                  label: const Text('Log Out'),
                  onPressed: _onLogout,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

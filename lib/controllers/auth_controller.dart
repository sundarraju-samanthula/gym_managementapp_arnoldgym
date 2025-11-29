import 'package:arnoldgym/routes/app_routes.dart';
import 'package:arnoldgym/screens/login/loginbottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../repositories/auth_repository.dart';
import '../shared/utils/storage_util.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepository;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
    serverClientId:
        '367310603826-hhgtj0ggr35toal812i7dqv262lfd95j.apps.googleusercontent.com',
  );

  var isLoading = false.obs;
  var userID = ''.obs;
  var accCreated = 0.obs;

  AuthController(this._authRepository);

  Future<void> loginWithGoogle() async {
    try {
      isLoading.value = true;

      final account = await _googleSignIn.signIn();
      if (account == null) return;

      final auth = await account.authentication;
      if (auth.idToken == null) throw Exception('Invalid Google Login');

      final authResponse = await _authRepository.login(
        auth.idToken!,
        'manager',
      );
      await StorageUtil.saveToken(authResponse.token);
      await StorageUtil.saveUserID(authResponse.userID);

      userID.value = authResponse.userID;

      final profile = await _authRepository.fetchProfile(authResponse.userID);

      accCreated.value =
          (profile['accCreated'] == true || profile['accCreated'] == 1) ? 1 : 0;
      await StorageUtil.setAccCreated(accCreated.value);

      Get.offAllNamed(accCreated.value == 1 ? '/dashboard' : '/basic-profile');
    } catch (e) {
      Get.snackbar('Login Failed', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Future<void> logout() async {
  //   await StorageUtil.clearAll();
  //   await _googleSignIn.signOut();
  //   Get.offAllNamed('/login');
  // }

  Future<void> decideNavigation() async {
    await Future.delayed(const Duration(milliseconds: 800));

    final prefs = await SharedPreferences.getInstance();
    final hasOnboarded = prefs.getBool('hasOnboarded') ?? false;
    final profileDone = prefs.getBool('profileCompleted') ?? false;

    if (!hasOnboarded) {
      Get.offAllNamed(AppRoutes.onboarding);
    } else if (!profileDone) {
      Get.offAllNamed(AppRoutes.basicProfile);
    } else {
      Get.offAllNamed(AppRoutes.dashboard);
    }
  }

  Future<void> onGetStarted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasOnboarded', true);

    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => LoginBottomSheet(
        onGoogleTap: loginWithGoogle,
        onLinkedInTap: loginWithLinkedIn,
        onFacebookTap: loginWithFacebook,
      ),
    );
  }

  void loginWithLinkedIn() {}
  void loginWithFacebook() {}
}

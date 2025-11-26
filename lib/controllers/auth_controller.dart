
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../repositories/auth_repository.dart';
import '../shared/utils/storage_util.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepository;

  //webclientid
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
      if (account == null) {
        Get.snackbar('Login Cancelled', 'User cancelled Google sign-in');
        return;
      }

      final auth = await account.authentication;
      final idToken = auth.idToken;
      if (idToken == null) {
        throw Exception('Google sign-in failed: idToken is null');
      }

      final authResponse = await _authRepository.login(idToken, 'manager');
      await StorageUtil.saveToken(authResponse.token);
      await StorageUtil.saveUserID(authResponse.userID);
      userID.value = authResponse.userID;

      final profile = await _authRepository.fetchProfile(authResponse.userID);
      final bool profileComplete =
          profile.containsKey('accCreated') &&
          (profile['accCreated'] == 1 || profile['accCreated'] == true);
      accCreated.value = profileComplete ? 1 : 0;
      await StorageUtil.setAccCreated(accCreated.value);

      if (accCreated.value == 1) {
        Get.offAllNamed('/dashboard');
      } else {
        Get.offAllNamed('/basic-profile');
      }
    } catch (e, st) {
      print('Google Login Error: $e\n$st');
      Get.snackbar('Login Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    await StorageUtil.clearAll();
    await _googleSignIn.signOut();
    userID.value = '';
    accCreated.value = 0;
    Get.offAllNamed('/login');
  }

  void loginWithLinkedIn() {}

  void loginWithFacebook() {}
}

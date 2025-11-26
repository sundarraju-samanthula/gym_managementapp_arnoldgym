
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BasicProfileController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = Rx<String?>(null);

  Future<void> submitProfileLocally(Map<String, String> profileData) async {
    try {
      isLoading.value = true;
      errorMessage.value = null;

      final prefs = await SharedPreferences.getInstance();

      await prefs.setString(
        'contactNumber',
        profileData['contactNumber'] ?? '',
      );
      await prefs.setString('city', profileData['city'] ?? '');
      await prefs.setString('state', profileData['state'] ?? '');
      await prefs.setString('country', profileData['country'] ?? '');
      await prefs.setString('pincode', profileData['pincode'] ?? '');

      
      await prefs.setBool('profileCompleted', true);

      
      bool? done = prefs.getBool('profileCompleted');
      print('DEBUG: profileCompleted saved = $done');

      Get.offAllNamed('/dashboard');
    } catch (e, st) {
      errorMessage.value = "Failed to save profile locally: ${e.toString()}";
      print('BasicProfileController Error → $e\n$st');
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> isProfileCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('profileCompleted') ?? false;
  }
}

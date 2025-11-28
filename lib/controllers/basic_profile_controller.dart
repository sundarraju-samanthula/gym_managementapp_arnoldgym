import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BasicProfileController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = Rx<String?>(null);

  final formKey = GlobalKey<FormState>();
  final TextEditingController phoneCtrl = TextEditingController();
  final TextEditingController cityCtrl = TextEditingController();
  final TextEditingController stateCtrl = TextEditingController();
  final TextEditingController countryCtrl = TextEditingController();
  final TextEditingController pincodeCtrl = TextEditingController();

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

      Get.offAllNamed('/dashboard');
    } catch (e, st) {
      errorMessage.value = "Failed: ${e.toString()}";
      print('Error → $e\n$st');
    } finally {
      isLoading.value = false;
    }
  }

  void onSubmit() {
    if (!formKey.currentState!.validate()) return;

    final profileData = {
      'contactNumber': phoneCtrl.text.trim(),
      'city': cityCtrl.text.trim(),
      'state': stateCtrl.text.trim(),
      'country': countryCtrl.text.trim(),
      'pincode': pincodeCtrl.text.trim(),
    };

    submitProfileLocally(profileData);
  }
}

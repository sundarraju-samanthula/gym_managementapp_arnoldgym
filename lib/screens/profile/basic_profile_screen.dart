import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/basic_profile_controller.dart';

class BasicProfileScreen extends StatelessWidget {
  final BasicProfileController controller = Get.find<BasicProfileController>();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController phoneCtrl = TextEditingController();
  final TextEditingController cityCtrl = TextEditingController();
  final TextEditingController stateCtrl = TextEditingController();
  final TextEditingController countryCtrl = TextEditingController();
  final TextEditingController pincodeCtrl = TextEditingController();

  BasicProfileScreen({Key? key}) : super(key: key);

  void _onSubmit() {
    if (!_formKey.currentState!.validate()) return;

    final profileData = {
      'contactNumber': phoneCtrl.text.trim(),
      'city': cityCtrl.text.trim(),
      'state': stateCtrl.text.trim(),
      'country': countryCtrl.text.trim(),
      'pincode': pincodeCtrl.text.trim(),
    };

    controller.submitProfileLocally(profileData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Complete Profile'), centerTitle: true),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: phoneCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Contact Number',
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (v) => v == null || v.trim().length < 10
                      ? 'Enter valid phone'
                      : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: cityCtrl,
                  decoration: const InputDecoration(labelText: 'City'),
                  validator: (v) =>
                      v == null || v.trim().isEmpty ? 'Enter city' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: stateCtrl,
                  decoration: const InputDecoration(labelText: 'State'),
                  validator: (v) =>
                      v == null || v.trim().isEmpty ? 'Enter state' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: countryCtrl,
                  decoration: const InputDecoration(labelText: 'Country'),
                  validator: (v) =>
                      v == null || v.trim().isEmpty ? 'Enter country' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: pincodeCtrl,
                  decoration: const InputDecoration(labelText: 'Pincode'),
                  keyboardType: TextInputType.number,
                  validator: (v) => v == null || v.trim().length < 4
                      ? 'Enter valid pincode'
                      : null,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _onSubmit,
                  child: const Text('Submit'),
                ),
                const SizedBox(height: 12),
                if (controller.errorMessage.value != null)
                  Text(
                    controller.errorMessage.value!,
                    style: const TextStyle(color: Colors.red),
                  ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

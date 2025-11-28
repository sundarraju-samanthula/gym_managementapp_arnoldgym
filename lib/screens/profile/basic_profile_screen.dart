import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/basic_profile_controller.dart';

class BasicProfileScreen extends StatelessWidget {
  final controller = Get.put(BasicProfileController());

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
            key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.phoneCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Contact Number',
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (v) => v == null || v.trim().length < 10
                      ? 'Enter valid phone'
                      : null,
                ),
                SizedBox(height: 12),

                TextFormField(
                  controller: controller.cityCtrl,
                  decoration: const InputDecoration(labelText: 'City'),
                  validator: (v) => v!.isEmpty ? 'Enter city' : null,
                ),
                SizedBox(height: 12),

                TextFormField(
                  controller: controller.stateCtrl,
                  decoration: const InputDecoration(labelText: 'State'),
                  validator: (v) => v!.isEmpty ? 'Enter state' : null,
                ),
                SizedBox(height: 12),

                TextFormField(
                  controller: controller.countryCtrl,
                  decoration: const InputDecoration(labelText: 'Country'),
                  validator: (v) => v!.isEmpty ? 'Enter country' : null,
                ),
                SizedBox(height: 12),

                TextFormField(
                  controller: controller.pincodeCtrl,
                  decoration: const InputDecoration(labelText: 'Pincode'),
                  keyboardType: TextInputType.number,
                  validator: (v) =>
                      v!.length < 4 ? 'Enter valid pincode' : null,
                ),
                SizedBox(height: 24),

                ElevatedButton(
                  onPressed: controller.onSubmit,
                  child: Text('Submit'),
                ),

                if (controller.errorMessage.value != null)
                  Text(
                    controller.errorMessage.value!,
                    style: TextStyle(color: Colors.red),
                  ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

// lib/bindings/basic_profile_binding.dart

import 'package:get/get.dart';
import '../repositories/auth_repository.dart';
import '../api/global/auth_api_service.dart';
import '../api/global/apiclient.dart';
import '../controllers/basic_profile_controller.dart';

class BasicProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthApiService>(() {
      final dio = ApiClient().dio;
      return AuthApiService(dio);
    });

    Get.lazyPut<AuthRepository>(
      () => AuthRepository(Get.find<AuthApiService>()),
      fenix: true,
    );

    Get.lazyPut<BasicProfileController>(
      () => BasicProfileController(),
      fenix: true,
    );
  }
}

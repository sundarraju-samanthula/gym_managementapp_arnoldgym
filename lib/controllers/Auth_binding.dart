import 'package:get/get.dart';

import '../api/global/apiclient.dart';
import '../api/global/auth_api_service.dart';
import '../repositories/auth_repository.dart';
import '../controllers/auth_controller.dart';
import '../controllers/basic_profile_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthApiService>(
      () => AuthApiService(ApiClient().dio),
      fenix: true,
    );
    Get.lazyPut<AuthRepository>(
      () => AuthRepository(Get.find<AuthApiService>()),
      fenix: true,
    );
    Get.lazyPut<AuthController>(
      () => AuthController(Get.find<AuthRepository>()),
      fenix: true,
    );
  }
}

import 'package:get/get.dart';
import 'package:travelonline/core/viewmodels/view_models.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => SplashViewModel());
  }
}

import 'package:get/get.dart';
import 'package:travel_online/core/view_models/view_models.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashViewModel());
  }
}

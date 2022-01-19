import 'package:get/get.dart';
import 'package:travel_online/views/splash_view.dart';

part 'routes.dart';

// ignore: avoid_classes_with_only_static_members
class Pages {
  // ignore: constant_identifier_names
  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashView(),
    ),
  ];
}

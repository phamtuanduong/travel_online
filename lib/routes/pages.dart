import 'package:get/get.dart';
import 'package:travelonline/views/auth/login_view.dart';
import 'package:travelonline/views/splash_view.dart';

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
    GetPage(
      name: Routes.login,
      page: () => const LoginView(),
    ),
  ];
}

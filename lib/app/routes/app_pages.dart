import 'package:get/get.dart';
import 'package:ifa_21312103/app/modules/login/bindings/login_binding.dart';
import 'package:ifa_21312103/app/modules/login/views/login_view.dart';
import 'package:ifa_21312103/app/modules/signup/bindings/signup_binding.dart';
import 'package:ifa_21312103/app/modules/signup/views/signup_views.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.login;

  static final routes = [
    GetPage(
      name: _Paths.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.signUp,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),

  ];
}

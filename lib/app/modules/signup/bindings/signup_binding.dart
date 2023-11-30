import 'package:get/get.dart';
import 'package:ifa_21312103/app/controller/signup_controller.dart';

class SignupBinding extends Bindings{
   @override
  void dependencies() {
    Get.lazyPut<SignupController>(() => SignupController());
  }
}
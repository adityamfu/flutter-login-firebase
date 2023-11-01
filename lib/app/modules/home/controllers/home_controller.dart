import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ifa_21312103/app/routes/app_pages.dart';

class HomeController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final count = 0.obs;

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  void increment() => count.value++;

  Future<void> logout() async {
    await _auth.signOut();
    Get.offAllNamed(Routes.login);
  }
}

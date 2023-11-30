import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifa_21312103/app/controller/auth_controller.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:ifa_21312103/app/routes/app_pages.dart';
import 'package:logger/logger.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final RxString email = ''.obs;
  final RxString password = ''.obs;
  final RxString emailError = ''.obs;
  final RxString passwordError = ''.obs;
  final showPassword = RxBool(false);
  final logger = Logger();
  final AuthController _authController = Get.find();

  void updateEmail(String value) {
    email.value = value;
    emailError.value = '';
  }

  void updatePassword(String value) {
    password.value = value;
    passwordError.value = '';
  }

  void toggleShowPassword() {
    showPassword.value = !showPassword.value;
  }

  void goToSignUp() {
    Get.toNamed('/signUp');
  }

  Future<void> login() async {
    if (email.value.isEmpty || !GetUtils.isEmail(email.value)) {
      emailError.value = 'Invalid email';
      return;
    }

    if (password.value.isEmpty) {
      passwordError.value = 'Password cannot be empty';
      return;
    }

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );

      if (userCredential.user != null) {
        logger.d('Login successful');
        Get.offNamed(Routes.home);
      } else {
        logger.e('Login failed: User is null');
        passwordError.value =
            'Login failed. Please check your email and password.';
      }
    } catch (e) {
      logger.e('Error: $e');
      passwordError.value =
          'Login failed. Please check your email and password.';
    }
  }

  void showResetPasswordModal() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Reset Password',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _authController.emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Get.back();
                resetPassword();
              },
              child: const Text('Reset Password'),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 10,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );
  }

  Future<void> resetPassword() async {
    try {
      await _authController.resetPassword(_authController.emailController.text);
    } catch (e) {
      print("Reset password failed: $e");
    }
  }

  // Future<void> loginWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser!.authentication;
  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );

  //     final UserCredential userCredential =
  //         await _auth.signInWithCredential(credential);

  //     if (userCredential.user != null) {
  //       logger.d('Login with Google successful');
  //       Get.offNamed(Routes.home);
  //     }
  //   } catch (e) {
  //     logger.e('Error: $e');
  //   }
  // }
}

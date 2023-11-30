import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifa_21312103/app/routes/app_pages.dart';

class AuthController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();
  Rx<User?> user = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    // Subscribe to auth changes when the controller is initialized
    auth.authStateChanges().listen((User? newUser) {
      user.value = newUser;
    });
  }

  void _showVerificationDialog(String emailAddress) {
    Get.defaultDialog(
      title: "Verification Email",
      middleText: "We have sent a verification email to $emailAddress.",
      onConfirm: () {
        Get.back(); // Close dialog
        Get.back(); // Navigate back to login or another screen
      },
      textConfirm: "OK",
    );
  }

  void signup(String emailAddress, String password) async {
    try {
      UserCredential myUser = await auth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      await myUser.user!.sendEmailVerification();
      _showVerificationDialog(emailAddress);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void login(String emailAddress, String password) async {
    try {
      UserCredential myUser = await auth.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      if (myUser.user!.emailVerified) {
        //untuk routing
        Get.offAllNamed(Routes.home);
      } else {
        Get.defaultDialog(
          title: "Verifikasi email",
          middleText: "Harap verifikasi email terlebih dahulu",
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.defaultDialog(
            title: "Terjadi kesalahan",
            middleText: "No user found for that email.");

        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.defaultDialog(
            title: "Terjadi kesalahan",
            middleText: "Wrong password provided for that user.");

        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      Get.defaultDialog(
        title: "Reset Password",
        middleText: "A password reset link has been sent to your email $email.",
        onConfirm: () {
          Get.back(); // Close dialog
        },
        textConfirm: "OK",
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  // void resetPassword(String email) async {
  //   if (email != "" && GetUtils.isEmail(email)) {
  //     try {
  //       await auth.sendPasswordResetEmail(email: email);
  //       Get.defaultDialog(
  //         title: "Berhasil",
  //         middleText: "Kami telah mengirimkan reset password ke $email",
  //         onConfirm: () {
  //           Get.back();
  //           Get.back();
  //         },
  //         textConfirm: "OK",
  //       );
  //     } catch (e) {
  //       Get.defaultDialog(
  //           title: "Terjadi kesalahan",
  //           middleText: "Tidak dapat melakukan reset password.");
  //     }
  //   } else {
  //     Get.defaultDialog(
  //         title: "Terjadi kesalahan", middleText: "Email tidak valid");
  //   }
  // }

  void logut() {}
}

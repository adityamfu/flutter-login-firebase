import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  final LoginController loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Obx(() => TextField(
                    onChanged: (value) => loginController.updateEmail(value),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      errorText: loginController.emailError.value,
                    ),
                  )),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Obx(() => TextField(
                    onChanged: (value) => loginController.updatePassword(value),
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      errorText: loginController.passwordError.value,
                    ),
                  )),
            ),
            ElevatedButton(
              onPressed: () {
                loginController.login();
              },
              child: const Text('Login with Email & Password'),
            ),
            const SizedBox(height: 16.0),
            const Text('Or login with:'),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // loginController.loginWithGoogle();
                  },
                  child: Image.asset(
                    'assets/google.png',
                    width: 48,
                    height: 48,
                  ),
                ),
                const SizedBox(width: 16.0),
                GestureDetector(
                  onTap: () {
                    // Handle Email login
                  },
                  child: Image.asset(
                    'assets/gmail.png',
                    width: 48,
                    height: 48,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifa_21312103/app/controller/auth_controller.dart';
import '../../../controller/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final CAuth = Get.find<AuthController>();
  final LoginController loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 239, 16, 0),
                    Color.fromARGB(255, 104, 63, 8),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade600,
                    spreadRadius: 1,
                    blurRadius: 15,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/uti.png',
                    width: 80,
                    height: 80,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "UNIVERSITAS TEKNOKRAT\nINDONESIA",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "ASEAN's Best Private University",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.yellowAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: const Text(
                "TEKNOKRAT EVENT",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Obx(() => TextField(
                    onChanged: (value) => loginController.updateEmail(value),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      errorText: loginController.emailError.value,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      prefixIcon: const Icon(Icons.email),
                    ),
                  )),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Obx(() => TextField(
                    onChanged: (value) => loginController.updatePassword(value),
                    // obscureText: true,
                    obscureText: !loginController.showPassword.value,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      errorText: loginController.passwordError.value,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(loginController.showPassword.value
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () => loginController.toggleShowPassword(),
                      ),
                    ),
                  )),
            ),
            ElevatedButton(
              onPressed: () {
                loginController.login();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                'LOGIN',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.white70,
                ),
              ),
            ),
            const SizedBox(height: 26.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Lupa Password?'),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Reset Password',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
            Container(
              height: 1.0,
              width: 400,
              color: Colors.red,
            ),
            const SizedBox(height: 16.0),
            const Text('Or login with'),
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
                    'assets/facebook.png',
                    width: 40,
                    height: 40,
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 40),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Developed By:'),
                      SizedBox(width: 10.0),
                      Text(
                        'Aditya Muhammad',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Try Login, This Page Allow you to HomePage!',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      color: Color.fromARGB(255, 210, 122, 7),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final HomeController homeController = Get.put(HomeController());
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login Successful',
              style: TextStyle(fontSize: 20),
            ),
            const Text(
              'Hi Welcome Home !',
              style: TextStyle(fontSize: 50),
            ),
            ElevatedButton(
              onPressed: () {
                homeController.logout();
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veegil_bank/Api/apiClient.dart';
import 'package:veegil_bank/screens/Login/login_up_model.dart';
import 'package:veegil_bank/screens/HomeScreen/homeScreen.dart';

class LoginController extends GetxController {
  final isLoading = false.obs;
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<dynamic> login() async {
    isLoading.value = true;
    LoginModel loginModel = LoginModel(
        phoneNumber: phoneController.text, password: passwordController.text);

    try {
      final response = await ApiClient.makeHttpRequest(
        '/auth/login',
        body: loginModelToJson(loginModel),
      );

      final data = jsonDecode(response.body) as Map<String, dynamic>;
      if (data['status'] == 'success') {
        Get.to(() => HomeScreen());
      }
    } catch (e) {
      print(e.toString());
      Get.snackbar('Error', 'Invalid credentials');
    } finally {
      isLoading.value = false;
    }
    print(isLoading.value);
  }
}

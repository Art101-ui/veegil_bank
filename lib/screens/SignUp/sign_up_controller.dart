import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veegil_bank/Api/apiClient.dart';
import 'package:veegil_bank/screens/Login/login.dart';
import 'package:veegil_bank/screens/SignUp/sign_up_model.dart';
import 'package:veegil_bank/screens/HomeScreen/homeScreen.dart';

class SignUpController extends GetxController {
  final isLoading = false.obs;
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> register() async {
    SignUpModel signUpModel = SignUpModel(
        phoneNumber: phoneController.text, password: passwordController.text);

    isLoading.value = true;
    try {
      final response = await ApiClient.makeHttpRequest(
        '/auth/signup',
        body: signUpModelToJson(signUpModel),
      );

      final data = jsonDecode(response.body) as Map<String, dynamic>;
      if (data['status'] == 'success') {
        Get.to(() => HomeScreen());
      } else {
        Get.snackbar('Error', data['message'], colorText: Colors.red);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veegil_bank/Api/apiClient.dart';
import 'package:veegil_bank/screens/Credit/credit_model.dart';

import 'package:veegil_bank/screens/HomeScreen/homeScreen.dart';

class CreditController extends GetxController {
  final isLoading = false.obs;
  TextEditingController phoneController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  Future<dynamic> transfer() async {
    isLoading.value = true;
    CreditModel creditModel = CreditModel(
        phoneNumber: phoneController.text,
        amount: int.parse(amountController.text));

    try {
      final response = await ApiClient.makeHttpRequest(
        '/accounts/transfer',
        body: creditModelToJson(creditModel),
      );

      final data = jsonDecode(response.body) as Map<String, dynamic>;
    } catch (e) {
      print(e.toString());
      Get.snackbar('Error', 'Invalid credentials');
    } finally {
      isLoading.value = false;
    }
    print(isLoading.value);
  }
}

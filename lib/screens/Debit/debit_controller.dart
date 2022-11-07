import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veegil_bank/Api/apiClient.dart';
import 'package:veegil_bank/screens/Debit/debit_model.dart';


class DebitController extends GetxController {
  final isLoading = false.obs;
  TextEditingController phoneController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  Future<dynamic> withdraw() async {
    isLoading.value = true;
    DebitModel debitModel = DebitModel(
        phoneNumber: phoneController.text,
        amount: int.parse(amountController.text));

    try {
      final response = await ApiClient.makeHttpRequest(
        '/accounts/withdraw',
        body: debitModelToJson(debitModel),
      );

      final data = jsonDecode(response.body) as Map<String, dynamic>;

      Get.snackbar(
                        'Success', "Go to homescreen and refresh to view changes",
                        colorText: Colors.green);
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar('Error', 'Invalid credentials');
    } finally {
      isLoading.value = false;
    }
    
  }
}

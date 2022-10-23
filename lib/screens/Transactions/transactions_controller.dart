import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veegil_bank/Api/apiClient.dart';
import 'package:veegil_bank/screens/HomeScreen/homeScreen_model.dart';
import 'package:veegil_bank/screens/SignUp/sign_up_model.dart';
import 'package:veegil_bank/screens/HomeScreen/homeScreen.dart';
import 'package:veegil_bank/screens/Transactions/transactions_model.dart';

class TransactionsController extends GetxController {
  final isLoading = false.obs;

  @override
  void onInit() {
    getTransactions();
    super.onInit();
  }

  

  Future<List<TransactionsModel>?> getTransactions() async {
    isLoading.value = true;
    try {
      final response = await ApiClient.makeHttpRequest(
        type: HttpRequestType.GET,
        '/transactions',
      );

      final data = jsonDecode(response.body);
      List<TransactionsModel> transactions = [];

      for (var d in data['data']) {
        TransactionsModel transaction = TransactionsModel(
          d['type'],
          d['amount'],
          d['phoneNumber'],
        );

        transactions.add(transaction);
      }

      print(transactions.length);
      return transactions.reversed.toList();
    } catch (e) {
      Get.snackbar('Error', e.toString());
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}

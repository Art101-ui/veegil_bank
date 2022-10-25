import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veegil_bank/Api/apiClient.dart';
import 'package:veegil_bank/screens/HomeScreen/homeScreen_model.dart';
import 'package:veegil_bank/screens/Login/login_controller.dart';
import 'package:veegil_bank/screens/SignUp/sign_up_controller.dart';

class HomeScreenController extends GetxController {
  LoginController loginController = Get.put(LoginController());
  SignUpController signUpController = Get.put(SignUpController());

  final isLoading = false.obs;

  @override
  void onInit() {
    getTransactions();
    getMoney();
    super.onInit();
  }

  Future<List<HomeModel>?> getTransactions() async {
    isLoading.value = true;
    try {
      final response = await ApiClient.makeHttpRequest(
        type: HttpRequestType.GET,
        '/transactions',
      );

      final data = jsonDecode(response.body);
      List<HomeModel> transactions = [];

      for (var d in data['data']) {
        HomeModel transaction = HomeModel(d['type'], d['amount'],
            d['phoneNumber'], DateTime.parse(d['created']));

        transactions.add(transaction);
      }

      return transactions.reversed.toList();
    } catch (e) {
      Get.snackbar('Error', e.toString());
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<dynamic> getMoney() async {
    isLoading.value = true;

    try {
      final response = await ApiClient.makeHttpRequest(
        type: HttpRequestType.GET,
        '/accounts/list',
      );

      final data = jsonDecode(response.body);

      for (var d in data['data']) {
        if (d['phoneNumber'] == loginController.phoneController.text) {
          var balance = d['balance'];

          return balance;
        }else if(d['phoneNumber'] == signUpController.phoneController.text){
          var balance = d['balance'];

          return balance;
        }
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}

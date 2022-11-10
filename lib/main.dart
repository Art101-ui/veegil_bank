import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:veegil_bank/screens/Login/login.dart';
import 'package:veegil_bank/screens/SignUp/sign_up.dart';

import 'package:veegil_bank/screens/Debit/debit.dart';
import 'package:veegil_bank/screens/homescreen/homescreen.dart';
import 'package:veegil_bank/screens/Transactions/transactions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.

        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

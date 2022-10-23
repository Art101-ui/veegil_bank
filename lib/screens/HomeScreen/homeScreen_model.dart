import 'dart:convert';

class HomeModel {
  HomeModel(
    this.type,
    this.amount,
    this.phoneNumber,
  );

  String? type;
  int? amount;

  String? phoneNumber;
}

import 'dart:convert';

class TransactionsModel {
  TransactionsModel(
    this.type,
    this.amount,
    this.phoneNumber,
  );

  String? type;
  int? amount;

  String? phoneNumber;
}

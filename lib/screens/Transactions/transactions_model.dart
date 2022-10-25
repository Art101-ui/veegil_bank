import 'dart:convert';

class TransactionsModel {
  TransactionsModel(
    this.type,
    this.amount,
    this.phoneNumber,
    this.created
  );

  String? type;
  int? amount;
  String? phoneNumber;
    DateTime created;
}

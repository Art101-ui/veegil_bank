import 'dart:convert';

class HomeModel {
  HomeModel(this.type, this.amount, this.phoneNumber, this.created);

  String? type;
  int? amount;
  String? phoneNumber;
  DateTime created;
}

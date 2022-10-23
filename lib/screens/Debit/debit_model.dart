import 'dart:convert';

DebitModel debitModelFromJson(String str) =>
    DebitModel.fromJson(json.decode(str));

String debitModelToJson(DebitModel data) => json.encode(data.toJson());

class DebitModel {
  DebitModel({
    required this.phoneNumber,
    required this.amount,
  });

  String phoneNumber;
  int amount;

  factory DebitModel.fromJson(Map<String, dynamic> json) => DebitModel(
        phoneNumber: json["phoneNumber"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "amount": amount,
      };
}

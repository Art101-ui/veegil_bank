import 'dart:convert';

CreditModel creditModelFromJson(String str) =>
    CreditModel.fromJson(json.decode(str));

String creditModelToJson(CreditModel data) => json.encode(data.toJson());

class CreditModel {
  CreditModel({
    required this.phoneNumber,
    required this.amount,
  });

  String phoneNumber;
  int amount;

  factory CreditModel.fromJson(Map<String, dynamic> json) => CreditModel(
        phoneNumber: json["phoneNumber"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "amount": amount,
      };
}

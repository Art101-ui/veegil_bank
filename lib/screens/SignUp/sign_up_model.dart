 import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
    SignUpModel({
       required this.phoneNumber,
       required this.password,
    });

    String phoneNumber;
    String password;

    factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        phoneNumber: json["phoneNumber"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "password": password,
    };
}

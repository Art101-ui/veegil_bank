 import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
       required this.phoneNumber,
       required this.password,
    });

    String phoneNumber;
    String password;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        phoneNumber: json["phoneNumber"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "password": password,
    };
}

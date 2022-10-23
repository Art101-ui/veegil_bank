import 'package:flutter/material.dart';

class TextInputs extends StatelessWidget {
  final String textString;
  final TextInputType type;
  final TextEditingController controller;

  TextInputs({
    Key? key,
    required this.textString,
    required this.controller,
    this.type = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Color(0xFF000000)),
      cursorColor: Color.fromARGB(255, 49, 27, 146),
      keyboardType: type,
      decoration: InputDecoration(
        hintText: this.textString,
        hintStyle: TextStyle(
            color: Color(0xFF9b9b9b),
            fontSize: 15,
            fontWeight: FontWeight.normal),
      ),
    );
  }
}

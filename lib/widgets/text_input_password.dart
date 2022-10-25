import 'package:flutter/material.dart';
import 'package:veegil_bank/utilis/colors.dart';

class TextInputPassword extends StatefulWidget {
  final String textString;
  final TextEditingController controller;

  bool _passwordVisible = true;
  TextInputPassword({
    Key? key,
    required this.controller,
    required this.textString,
  }) : super(key: key);

  @override
  State<TextInputPassword> createState() => _TextInputPasswordState();
}

class _TextInputPasswordState extends State<TextInputPassword> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      style: TextStyle(color: Color(0xFF000000)),
      cursorColor: Color.fromARGB(255, 49, 27, 146),
      keyboardType: TextInputType.text,
      obscureText: widget._passwordVisible,
      decoration: InputDecoration(
        hintText: this.widget.textString,
        hintStyle: TextStyle(
            color: Color(0xFF9b9b9b),
            fontSize: 15,
            fontWeight: FontWeight.normal),
        suffixIcon: IconButton(
          icon: Icon(
            // Based on passwordVisible state choose the icon
            widget._passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: AppColors.textColor,
          ),
          onPressed: () {
            // Update the state i.e. toogle the state of passwordVisible variable
            setState(() {
              widget._passwordVisible = !widget._passwordVisible;
            });
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  const FormInput(
      {Key? key,
      required this.placeholder,
      required this.controller,
      required this.isPwd})
      : super(key: key);

  final String placeholder;
  final TextEditingController controller;
  final bool isPwd;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextField(
        controller: controller,
        obscureText: isPwd,
        decoration: InputDecoration(
            hintText: placeholder,
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF07B0E5))),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF07b0e5)))),
      ),
    );
  }
}

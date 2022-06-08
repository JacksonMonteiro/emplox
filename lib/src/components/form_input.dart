import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  const FormInput(
      {Key? key,
      required this.placeholder,
      required this.controller,
      required this.isPwd,
      required this.errorTxt})
      : super(key: key);

  final String placeholder;
  final bool isPwd;
  final String? errorTxt;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        controller: controller,
        obscureText: isPwd,
        decoration: InputDecoration(
            hintText: placeholder,
            errorText: errorTxt,
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF07B0E5))),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF07b0e5)))),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  const FormInput(
      {Key? key, required this.placeholder, required this.controller})
      : super(key: key);

  final String placeholder;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextField(
        controller: controller,
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

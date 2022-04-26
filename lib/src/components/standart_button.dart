import 'package:flutter/material.dart';

class StandartButton extends StatelessWidget {
  const StandartButton({Key? key, required this.action, required this.text})
      : super(key: key);
  final String text;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: action,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(top: 21, bottom: 21),
          child: Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black)),
        ),
      ),
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ))),
    );
  }
}

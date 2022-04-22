import 'package:flutter/material.dart';

class ReturnButton extends StatelessWidget {
  const ReturnButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushReplacementNamed('/');
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)))),
      ),
      child: Padding(
          padding: EdgeInsets.only(top: 18, bottom: 18),
          child: Icon(Icons.arrow_back, color: Colors.black)),
    );
  }
}

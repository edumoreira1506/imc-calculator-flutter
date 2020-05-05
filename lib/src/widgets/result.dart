import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Result extends StatelessWidget {
  final String result;

  Result(this.result);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.result,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.green,
        fontSize: 25
      )
    );
  }
}

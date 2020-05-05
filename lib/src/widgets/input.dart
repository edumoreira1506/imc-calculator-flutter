import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Input extends StatelessWidget {
  final TextInputType type;
  final String labelText;
  final TextEditingController controller;
  final String Function(String) validator;

  Input(this.type, this.labelText, this.controller, this.validator);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: this.validator,
      keyboardType: type,
      decoration: InputDecoration(
        labelText: this.labelText,
        labelStyle: TextStyle(
          color: Colors.green
        )
      ),
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.green,
        fontSize: 25
      ),
      controller: controller,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Button extends StatelessWidget {
  final void Function() onPressed;

  Button(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
        height: 50,
        child: RaisedButton(
          onPressed: this.onPressed,
          child: Text(
            'Do it!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25
            ),
          ),
          color: Colors.green,
        ),
      )
    );
  }
}

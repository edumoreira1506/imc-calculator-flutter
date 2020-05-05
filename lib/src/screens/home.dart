import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:imc_calculator/src/widgets/header.dart';
import 'package:imc_calculator/src/widgets/input.dart';
import 'package:imc_calculator/src/widgets/user_icon.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(() {}),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          UserIcon(),
          Input(TextInputType.number, 'Peso (KG)'),
          Input(TextInputType.number, 'Altura (CM)'),
        ],
      )
    );
  }
}

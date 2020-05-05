import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:imc_calculator/src/widgets/button.dart';
import 'package:imc_calculator/src/widgets/header.dart';
import 'package:imc_calculator/src/widgets/input.dart';
import 'package:imc_calculator/src/widgets/result.dart';
import 'package:imc_calculator/src/widgets/user_icon.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool showImc = false;

  void _resetFields() {
    weightController.text = '';
    heightController.text = '';

    setState(() {
      showImc = false;
      _formKey = GlobalKey<FormState>();
    });
  }

  void _showImc() {
    if (_formKey.currentState.validate()) {
      setState(() {
        showImc = true;
      }); 
    }
  }

  double _calculate() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text) / 100;
    double imc = weight / (height * height);

    return imc;
  }

  String _getLabel() {
    double imc = this._calculate();

    if (imc < 18.6) {
      return "Abaixo do peso ${imc.toStringAsPrecision(4)}";
    } else if (imc >= 18.6 && imc < 24.9) {
      return "Peso ideal ${imc.toStringAsPrecision(4)}";
    } else if (imc >= 24.9 && imc <= 29.9) {
      return "Levemente acima do peso ${imc.toStringAsPrecision(4)}";
    } else if (imc >= 29.9 && imc > 34.9) {
      return "Obesidade Grau I ${imc.toStringAsPrecision(4)}";
    } else if (imc >= 34.9 && imc < 39.9) {
      return "Obesidade Grau II ${imc.toStringAsPrecision(4)}";
    } else {
      return "Obesidade Grau III ${imc.toStringAsPrecision(4)}";
    }
  }

  String _validator (value, sentence) {
    if (value.isEmpty) return sentence;

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(this._resetFields),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              UserIcon(),
              Input(
                TextInputType.number, 
                'Weight (KG)', 
                weightController,
                (value) => this._validator(value, 'Weight is required')
              ),
              Input(
                TextInputType.number, 
                'Height (CM)', 
                heightController,
                (value) => this._validator(value, 'Height is required')
              ),
              Button(this._showImc),
              Result(this.showImc ? this._getLabel() : '...')
            ],
          ),
        )
      )
    );
  }
}

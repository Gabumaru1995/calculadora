import 'package:flutter/material.dart';

void main() {
  runApp(CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String output = '0';
  double num1 = 0;
  double num2 = 0;
  String operador = '';

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        output = '0';
        num1 = 0;
        num2 = 0;
        operador = '';
      } else if (buttonText == '+' ||
          buttonText == '-' ||
          buttonText == '*' ||
          buttonText == '/') {
        num1 = double.parse(output);
        operador = buttonText;
        output = '0';
      } else if (buttonText == '=') {
        num2 = double.parse(output);
        if (operador == '+') {
          output = '${num1.toString()} + ${num2.toString()} = ${(num1 + num2).toString()}';
        } else if (operador == '-') {
          output = '${num1.toString()} - ${num2.toString()} = ${(num1 - num2).toString()}';
        } else if (operador == '*') {
          output = '${num1.toString()} * ${num2.toString()} = ${(num1 * num2).toString()}';
        } else if (operador == '/') {
          if (num2 == 0) {
            output = 'Error';
          } else {
            output = '${num1.toString()} / ${num2.toString()} = ${(num1 / num2).toString()}';
          }
        }
        num1 = 0;
        num2 = 0;
        operador = '';
      } else {
        if (output == '0') {
          output = buttonText;
        } else {
          output = output + buttonText;
        }
      }
    });
  }

  Widget buildButton(String buttonText) {
    return GestureDetector(
      onTap: () => buttonPressed(buttonText),
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(2, 2), blurRadius: 5)],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculadora')),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(output, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildButton('7'),
                buildButton('8'),
                buildButton('9'),
                buildButton('/')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildButton('4'),
                buildButton('5'),
                buildButton('6'),
                buildButton('*')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildButton('1'),
                buildButton('2'),
                buildButton('3'),
                buildButton('-')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildButton('C'),
                buildButton('0'),
                buildButton('='),
                buildButton('+')
              ],
            ),
          ],
        ),
      ),
    );
  }
}

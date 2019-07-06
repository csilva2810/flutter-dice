import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.indigo,
          appBar: AppBar(
            title: Text(
              'Dicee',
              style: TextStyle(
                color: Colors.indigo,
              ),
            ),
            backgroundColor: Colors.white,
          ),
          body: DicePage(),
        ),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int _generateRandomNumber() => new Random().nextInt(5) + 1;
  int leftDiceNumber = 1;
  int rightDiceNumber = 2;

  void updateDices() {
    setState(() {
      leftDiceNumber = _generateRandomNumber();
      rightDiceNumber = _generateRandomNumber();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Dice(
                onPressed: updateDices,
                number: leftDiceNumber,
              ),
            ),
            Expanded(
              child: Dice(
                onPressed: updateDices,
                number: rightDiceNumber,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Dice extends StatelessWidget {
  const Dice({
    Key key,
    this.number,
    @required this.onPressed,
  }) : super(key: key);

  final int number;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Image.asset('images/dice$number.png'),
    );
  }
}

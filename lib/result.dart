// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore == 0) {
      resultText =
          'You didn\'t get any of the answers right. Good luck next time!';
    } else if (resultScore == 10) {
      resultText = 'You got 1/4 answer right.';
    } else if (resultScore == 20) {
      resultText = 'Pretty good! You got 2/4 answers right!';
    } else if (resultScore == 30) {
      resultText = 'Well done! You got 3/4 answers right!';
    } else if (resultScore == 40) {
      resultText = 'Awesome! You got 4/4 answers right!';
    } else {
      resultText = 'You did it!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: resetHandler,
            child: Text('Restart Quiz!'),
            textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}

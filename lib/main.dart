import 'package:flutter/material.dart';

import './questions.dart';
import './answer.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What is 4 + 8?',
      'answers': [
        {'text': '15', 'score': 0},
        {'text': '13', 'score': 0},
        {'text': '12', 'score': 10},
        {'text': '11', 'score': 0}
      ]
    },
    {
      'questionText': 'What is 6 * 5?',
      'answers': [
        {'text': '25', 'score': 0},
        {'text': '30', 'score': 10},
        {'text': '35', 'score': 0},
        {'text': '32', 'score': 0}
      ]
    },
    {
      'questionText': 'What is the square root of 121?',
      'answers': [
        {'text': '11', 'score': 10},
        {'text': '12', 'score': 0},
        {'text': '10', 'score': 0},
        {'text': '13', 'score': 0}
      ]
    },
    {
      'questionText': 'What is 23 - 15?',
      'answers': [
        {'text': '8', 'score': 10},
        {'text': '7', 'score': 0},
        {'text': '6', 'score': 0},
        {'text': '9', 'score': 0}
      ]
    }
  ];

  var _index = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _index = 0;
      _totalScore = 0;
    });
    print(" ${_totalScore} ");
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _index++;
    });
    // print(_index);
    // print("${score} and ${_totalScore} ");
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_declarations

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First App'),
          // foregroundColor: const Color(0xFFFF9000),
        ),
        body: _index < _questions.length
            ? Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Question(
                    _questions[_index]['questionText'] as String,
                  ),
                  ...(_questions[_index]['answers']
                          as List<Map<String, Object>>)
                      .map((answer) {
                    return Answer(() => _answerQuestion(answer['score']),
                        answer['text'] as String);
                  }).toList()
                ],
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}

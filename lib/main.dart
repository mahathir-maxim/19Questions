import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return myAppState();
  }
}

class myAppState extends State<MyApp> {
  var _qInd = 0;
  var totalScore = 0;

  final _questions = const [
    {
      'questionText': 'Would you choose past or future?',
      'answers': [
        {'text': 'Past', 'score': 10},
        {'text': 'present', 'score': 200},
        {'text': 'future', 'score': 30},
      ],
    },
    {
      'questionText': 'What is your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'White', 'score': 20},
        {'text': 'Blue', 'score': 30},
        {'text': 'Red', 'score': 40},
      ],
    },
    {
      'questionText': 'What is your favorite band?',
      'answers': [
        {'text': 'Artcell', 'score': 25},
        {'text': 'PinkFloyd', 'score': 20},
        {'text': 'Eagles', 'score': 20},
      ],
    },
    {
      'questionText': 'Do you prefer night or day?',
      'answers': [
        {'text': 'night', 'score': 25},
        {'text': 'day', 'score': 25},
      ],
    },
  ];

  void _resetQuiz() {
    setState(() {
      {
        _qInd = 0;
        totalScore = 0;
      }
    });
  }

  void answerQ(int score) {
    totalScore += score;
    setState(() {
      _qInd = _qInd + 1;
    });
    if (_qInd < _questions.length) {
      print("We have more questions");
    }

    print(_qInd);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('19Questions'),
            backgroundColor: Colors.purple[900],
          ),
          backgroundColor: Colors.grey[850],
          body: _qInd < _questions.length
              ? Quiz(
                  answerQuestion: answerQ,
                  questionIndex: _qInd,
                  questions: _questions,
                )
              : Result(totalScore, _resetQuiz)),
    );
  }
}

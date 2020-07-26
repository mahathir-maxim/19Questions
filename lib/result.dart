import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function reset;
  Result(this.resultScore, this.reset);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 40) {
      resultText = 'You are pretty sad!';
    } else if (resultScore <= 70) {
      resultText = 'You are doing alright!';
    } else {
      resultText = 'You are really happy!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[
        Text(
          resultPhrase,
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            //backgroundColor: Colors.black,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        FlatButton(
          child: Text('Restart Quiz!'),
          onPressed: reset,
          textColor: Colors.white,
        )
      ]),
    );
  }
}

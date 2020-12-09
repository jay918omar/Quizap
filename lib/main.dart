import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizbrain = QuizBrain();
void main() => runApp(Quizap1());

class Quizap1 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Center(child:
          Text('QUIZAP'),
          ),
          backgroundColor: Colors.teal,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Quizpage(),
          ),
        ),
      ),
    );
  }
}

class Quizpage extends StatefulWidget {
  @override
  _QuizpageState createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {
  List<Icon> scorekeeper = [
  ];
  void checkAnswers(bool buttonInfo){
    bool correctAnswers = quizbrain.getQuestionAnswer();
    setState(() {
      if (quizbrain.isFinished() == true) {
        Alert(context: context, title: "Quizap", desc: "Do you want to close")
            .show();
        quizbrain.reset();
        scorekeeper = [];
      }
      else {
        if (buttonInfo == correctAnswers) {
          scorekeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scorekeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizbrain.nextQuestion();
      }
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(quizbrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: FlatButton(
                color: Colors.green,
                child: Text('True',
                  style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.white
                  ),
                ),
                onPressed: (){
                  checkAnswers(true);
                })
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: FlatButton(
                color: Colors.red,
                child: Text('False',
                  style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.white
                  ),
                ),
                onPressed:(){
                  checkAnswers(false);
                })
          ),
        ),
        Row(
            children: scorekeeper
        ),
      ],
    );
  }
}

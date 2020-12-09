import 'questions.dart';

class QuizBrain{
  int _questionNumber=0;
  List<Questions> _questionBank=[
    Questions(q:'Is Tajmahal situated in Agra?',a:true),
    Questions(q:'Is New Delhi not the capital of India?',a:false),
    Questions(q:'Is Lucknow the capital of UP?',a:true)
  ];

  void nextQuestion(){
    if (_questionNumber<_questionBank.length-1){
      _questionNumber++;
    }
  }
  String getQuestionText(){
    return _questionBank[_questionNumber].questionText;
  }
  bool getQuestionAnswer(){
    return _questionBank[_questionNumber].questionAnswers;
  }
  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      print('Now returning true');
      return true;

    } else {
      return false;
    }
  }
  void reset() {
    _questionNumber = 0;
  }
}


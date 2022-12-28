
import 'Question.dart';
class QuizBrain {

    int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question('Unit S.I of time is Meter' ,  false),
    Question('Unit S.I of Force is Newton', true),
    Question( 'Unit S.I of Length is meter', true),
    Question( 'Unit S.I of Electric Current is Ampere' , true),
    Question('Capital of Pakistan is Islamabad', true),
    Question('Capital of Australia is Canberra', true),
    Question('Capital of Canada is Ottawa', true),
    Question('Capital of India is New Delhi', true),
    Question('Capital of Bangladesh is Islamabad', false)
  ];


  String getQuestionText(){
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer(){
    return _questionBank[_questionNumber].answer;
  }

  void nextQuestion(){
    if(_questionNumber < _questionBank.length -1){
      _questionNumber++;
    }
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

import 'question.dart';
class AppBrain {
  var _number = 0;

  List<Question> _Questions = [
    Question('The number of '
        'planets in the solar system is eight planets',
        'images/image-1.jpg', true),
    Question('Cats are carnivorous animals',
        'images/image-2.jpg', true),
    Question('China is located in the African continent',
        'images/image-3.jpg', false),
    Question('The Earth is flat and not spherical',
        'images/image-4.jpg', false)
  ];

  void incrementNumber() {
    if (_number < _Questions.length - 1) {
      _number++;
    }
  }

  int getNumber() {
    return _number;
  }

  String getQuestionText() {
    return _Questions[_number].questionText;
  }

  bool getQuestionAnswer() {
    return _Questions[_number].questionAnswer;
  }

  String getQuestionImage() {
    return _Questions[_number].questionImage;
  }

  bool isFinished() {
    if (_number >= _Questions.length-1) {
      return true;
    }
    else {
      return false;
    }
  }

  void reset() {
    _number = 0;
  }
}


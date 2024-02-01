class Question {
  String questionText;
  List<String> answerChoices;
  String correctAnswer;

  Question({
    required this.questionText,
    required this.answerChoices,
    required this.correctAnswer,
  });
}

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question(
      questionText: 'What is the official name of the largest city in India?',
      answerChoices: ['A. Mumbai', 'B. Kolkata', 'C. Chennai', 'D. New Delhi'],
      correctAnswer: 'A. Mumbai',
    ),
    Question(
      questionText:
          'Who was India\'s first Deputy Prime Minister and Home Minister??',
      answerChoices: [
        'A. Sardar Patel ji',
        'B. Jawaharlal Nehru',
        'C. Indira Gandhi',
        'D. Rajiv Gandhi'
      ],
      correctAnswer: 'B. Jawaharlal Nehru',
    ),
    Question(
      questionText:
          'The city of Varanasi is situated on the banks of which river?',
      answerChoices: ['A.Brahmaputra', 'B. yamuna', 'C. Ganga', 'D. Godavari'],
      correctAnswer: 'C. Ganga',
    ),
    Question(
      questionText:
          ' Who played crucial role in establishing the Indian Space Research Organisation (ISRO)?',
      answerChoices: [
        'A. Dr. Homi Bhabha',
        'B. Dr. APJ Abdul Kalam',
        'C. Dr. Vikram Sarabhai',
        'D. C.V. Raman'
      ],
      correctAnswer: 'C. Dr. Vikram Sarabhai',
    ),
    Question(
      questionText: 'Which animal is featured on the official emblem of India?',
      answerChoices: [
        'A. Indian Peafowl',
        'B. Rhino',
        'C. Bengal Tiger',
        'D. Elephant'
      ],
      correctAnswer: 'C. Bengal Tiger',
    ),
    Question(
      questionText:
          'Who is the Chief Minister of the Indian state of West Bengal?',
      answerChoices: [
        'A. Rahul Gandhi',
        'B. Narendra Modi',
        'C. Mamata Banerjee',
        'D. Arvind Kejriwal'
      ],
      correctAnswer: 'C. Mamata Banerjee',
    ),
    Question(
      questionText: 'Who is known as King Khan?',
      answerChoices: [
        'A. Salman Khan',
        'B. Aameer Khan',
        'C. Saif Ali Khan',
        'D. ShahRukh Khan'
      ],
      correctAnswer: 'D. ShahRukh Khan',
    ),
    Question(
      questionText:
          'Which fort di Chatrapati Shivaji Maharaj killed Afzal Khan?',
      answerChoices: [
        'A. Rajgad',
        'B. Janjira',
        'C. Pratapgad',
        'D. Vishalgad'
      ],
      correctAnswer: 'C. Pratapgad',
    ),
  ];

  String getquestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  List<String> getAnswerChoices() {
    return _questionBank[_questionNumber].answerChoices;
  }

  String getCorrectAnswer() {
    return _questionBank[_questionNumber].correctAnswer;
  }

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    } else {
      _questionNumber = 0;
    }
  }

  bool isFinished() {
    return _questionNumber >= _questionBank.length - 1;
  }

  void reset() {
    _questionNumber = 0;
  }
}

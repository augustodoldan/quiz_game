import 'package:quiz_new/models/quiz_question.dart';

class QuestionsRandom {
  const QuestionsRandom(this.questions);

  final List<QuizQuestion> questions;

  List<QuizQuestion> getShuffledQuestions() {
    dynamic shuffledList = List.of(questions);
    shuffledList.shuffle();
    if (shuffledList.length > 5) {
      shuffledList = shuffledList.sublist(0, 5);
    }
    return shuffledList;
  }
}

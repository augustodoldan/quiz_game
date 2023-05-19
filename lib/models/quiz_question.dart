import 'package:uuid/uuid.dart';

class QuizQuestion {
  QuizQuestion(this.text, this.answers) {
    id = const Uuid().v4();
  }
  final String text;
  final List<String> answers;
  String id = '';

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();

    return shuffledList;
  }
}

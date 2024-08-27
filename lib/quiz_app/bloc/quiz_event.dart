// quiz_event.dart
abstract class QuizEvent {}

class OptionSelected extends QuizEvent {
  final int selectedOptionIndex;

  OptionSelected(this.selectedOptionIndex);
}

class NextQuestion extends QuizEvent {}

class QuizComplete extends QuizEvent {}

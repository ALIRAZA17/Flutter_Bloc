import 'package:equatable/equatable.dart';

class QuizState extends Equatable {
  final int currentQuestionIndex;
  final bool isOptionSelected;
  final bool isQuizComplete;
  final int? selectedOptionIndex;

  const QuizState({
    required this.currentQuestionIndex,
    required this.isOptionSelected,
    this.isQuizComplete = false,
    this.selectedOptionIndex,
  });

  QuizState copyWith({
    int? currentQuestionIndex,
    bool? isOptionSelected,
    bool? isQuizComplete,
    int? selectedOptionIndex,
  }) {
    return QuizState(
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      isOptionSelected: isOptionSelected ?? this.isOptionSelected,
      isQuizComplete: isQuizComplete ?? this.isQuizComplete,
      selectedOptionIndex: selectedOptionIndex ?? this.selectedOptionIndex,
    );
  }

  @override
  List<Object?> get props => [currentQuestionIndex, isOptionSelected, isQuizComplete, selectedOptionIndex];
}

// quiz_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/quiz_app/bloc/quiz_event.dart';
import 'package:flutter_bloc_test/quiz_app/bloc/quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final List<Map<String, Object>> questions;
  int _correctAnswers = 0;

  QuizBloc(this.questions)
      : super(const QuizState(currentQuestionIndex: 0, isOptionSelected: false)) {
    on<OptionSelected>((event, emit) {
      emit(state.copyWith(
          selectedOptionIndex: event.selectedOptionIndex,
          isOptionSelected: true));

      // Check if the selected option is correct
      if (event.selectedOptionIndex ==
          questions[state.currentQuestionIndex]['answer']) {
        _correctAnswers++;
      }
    });

    on<NextQuestion>((event, emit) {
      if (state.currentQuestionIndex < questions.length - 1) {
        emit(QuizState(
            currentQuestionIndex: state.currentQuestionIndex + 1,
            isOptionSelected: false));
      } else {
        emit(state.copyWith(isQuizComplete: true));
      }
    });
  }

  int get correctAnswers => _correctAnswers;
}

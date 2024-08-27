import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/quiz_app/bloc/quiz_bloc.dart';
import 'package:flutter_bloc_test/quiz_app/bloc/quiz_event.dart';
import 'package:flutter_bloc_test/quiz_app/bloc/quiz_state.dart';
import 'package:flutter_bloc_test/quiz_app/bloc/quiz_result.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizBloc([
        {
          'question': 'What is the capital of France?',
          'options': ['Berlin', 'London', 'Paris', 'Rome'],
          'answer': 2,
        },
        {
          'question': 'What is 2 + 2?',
          'options': ['3', '4', '5', '6'],
          'answer': 1,
        },
        {
          'question': 'What is the capital of Italy?',
          'options': ['Rome', 'Paris', 'Berlin', 'Madrid'],
          'answer': 0,
        },
        {
          'question': 'What is the color of the sky?',
          'options': ['Blue', 'Red', 'Green', 'Yellow'],
          'answer': 0,
        },
      ]),
      child: const QuizScreen(),
    );
  }
}

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: BlocConsumer<QuizBloc, QuizState>(
        listener: (context, state) {
          if (state.isQuizComplete) {
            final quizBloc = context.read<QuizBloc>();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ResultPage(
                  correctAnswers: quizBloc.correctAnswers,
                  totalQuestions: quizBloc.questions.length,
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          final bloc = context.read<QuizBloc>();
          final currentQuestionIndex = state.currentQuestionIndex;
          if (currentQuestionIndex < 0 ||
              currentQuestionIndex >= bloc.questions.length) {
            return const Center(child: Text('Start the quiz'));
          } else {
            final question = bloc.questions[currentQuestionIndex];
            final options = question['options'] as List<String>?;
            if (options == null) {
              return const Center(child: Text('Options not available'));
            }
            return Column(
              children: [
                Text(
                  question['question'] as String,
                  style: const TextStyle(fontSize: 24),
                ),
                ...List.generate(options.length, (index) {
                  final isSelected = state.selectedOptionIndex == index;
                  return ElevatedButton(
                    onPressed: () {
                      bloc.add(OptionSelected(index));
                    },
                    child: Text(
                      options[index],
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  );
                }),
                if (state.isOptionSelected)
                  ElevatedButton(
                    onPressed: () {
                      bloc.add(NextQuestion());
                    },
                    child: const Text('Next'),
                  ),
              ],
            );
          }
        },
      ),
    );
  }
}

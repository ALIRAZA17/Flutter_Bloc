import 'package:flutter/material.dart';
import 'package:flutter_bloc_test/quiz_app/quiz_ui.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Shared BLoC Example',
      home: QuizPage(),
    );
  }
}


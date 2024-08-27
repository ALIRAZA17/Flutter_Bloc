import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/first_screen.dart';
import 'text_bloc.dart';  // Your BLoC file

void main() {
  runApp(
    BlocProvider(
      create: (context) => TextBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Shared BLoC Example',
      home: FirstScreen(),
    );
  }
}


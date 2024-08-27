import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'text_bloc.dart';  // Your BLoC file

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: Center(
        child: BlocBuilder<TextBloc, TextState>(
          builder: (context, state) {
            String displayText = '';
            if (state is UpdatedTextState) {
              displayText = state.text;
            }
            return Text(
              displayText,
              style: const TextStyle(fontSize: 24.0),
            );
          },
        ),
      ),
    );
  }
}

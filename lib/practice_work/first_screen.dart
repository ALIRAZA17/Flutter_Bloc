import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/second_screen.dart';
import 'text_bloc.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextBloc textBloc = BlocProvider.of<TextBloc>(context);
    TextEditingController textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('First Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<TextBloc, TextState>(
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
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter text',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final text = textController.text;
                textBloc.add(UpdateTextEvent(text));
              },
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondScreen()),
                );
              },
              child: const Text('Go to Second Screen'),
            ),
          ],
        ),
      ),
    );
  }
}

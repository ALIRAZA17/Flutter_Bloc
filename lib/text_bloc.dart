import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class TextEvent {}

class UpdateTextEvent extends TextEvent {
  final String text;

  UpdateTextEvent(this.text);
}

// States
abstract class TextState {}

class InitialTextState extends TextState {}

class UpdatedTextState extends TextState {
  final String text;

  UpdatedTextState(this.text);
}

// BLoC
class TextBloc extends Bloc<TextEvent, TextState> {
  TextBloc() : super(InitialTextState()) {
    on<UpdateTextEvent>((event, emit) => emit(UpdatedTextState(event.text)));
  }
}

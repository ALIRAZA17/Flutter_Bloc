import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/flutter_counter/app.dart';
import 'package:flutter_bloc_test/flutter_counter/counter_observer.dart';

void main() {
  Bloc.observer = const CounterObserver();
  runApp(const CounterApp());
}
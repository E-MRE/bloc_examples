import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleCubitExample extends Cubit<int> {
  SimpleCubitExample() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}

void main(List<String> args) {
  final cubit = SimpleCubitExample();
  _simpleExamples(cubit);
  _streamExamples(cubit);
  cubit.close();
}

void _simpleExamples(SimpleCubitExample cubit) {
  log(cubit.state.toString());

  cubit.increment();
  cubit.increment();

  log(cubit.state.toString());

  cubit.decrement();
  log(cubit.state.toString());
}

Future<void> _streamExamples(SimpleCubitExample cubit) async {
  final streamCubit = cubit.stream.listen((event) {
    log('Received Data: $event');
  });

  cubit.increment();
  cubit.increment();

  await Future.delayed(const Duration(seconds: 2));
  cubit.decrement();

  await streamCubit.cancel();
}

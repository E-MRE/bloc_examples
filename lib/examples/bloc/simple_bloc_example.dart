import 'package:flutter_bloc/flutter_bloc.dart';

enum CounterEvent { increment, decrement }

class SimpleBlocExample extends Bloc<CounterEvent, int> {
  SimpleBlocExample() : super(0);

  @override
  Stream<int> onEvent(CounterEvent event) async* {
    super.onEvent(event);
    switch (event) {
      case CounterEvent.increment:
        yield state + 1;
        break;

      case CounterEvent.decrement:
        yield state - 1;
        break;
    }
  }
}

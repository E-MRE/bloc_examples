import 'dart:developer';

class StreamExample {
  Stream<int> sendData() async* {
    for (var count = 0; count < 10; count++) {
      await Future.delayed(const Duration(seconds: 1));
      yield count;
    }
  }
}

void main() {
  StreamExample streamExample = StreamExample();
  Stream<int> stream = streamExample.sendData();

  stream.listen((event) {
    log('Received data: ${event.toString()}');
  });
}

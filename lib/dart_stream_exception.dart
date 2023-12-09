/// Support for doing something awesome.
///
/// More dartdocs go here.
library;

import 'dart:async';

export 'src/dart_stream_exception_base.dart';

// TODO: Export any libraries intended for clients of this package.

Future<List<int>> streamExceptionHandling(Stream<int> input) async {
  StreamController controller = StreamController();
  List<int> newList = [];
  input.listen(
    (event) {
      if (event.isOdd) {
        controller.add(event);
      }
    },
    onError: (error) {
      print(error);
    },
    onDone: () {
      controller.close();
    },
    cancelOnError: false,
  );

  await for (var indev in controller.stream) {
    newList.add(indev);
  }
  return newList;
}




/*
Practice Question 3: Stream Exception Handling
Task:
Implement a function streamExceptionHandling 
that takes a Stream<int>. It should process 
the stream and return a Future<List<int>>. 
If an exception is encountered, it should be 
caught, and the stream processing should continue.
 */
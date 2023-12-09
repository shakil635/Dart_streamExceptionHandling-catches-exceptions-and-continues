import 'package:dart_stream_exception/dart_stream_exception.dart';

import 'package:test/test.dart';

void main() {
  test('streamExceptionHandling catches exceptions and continues', () async {
    var input = Stream.fromIterable([1, 2, 3, 4, 5])
        .map((n) => n % 2 == 0 ? throw Exception('Even number') : n);
    var result = await streamExceptionHandling(input);
    expect(result,
        equals([1, 3, 5])); // Even numbers are skipped due to exceptions
  });

  test('streamExceptionHandling handles all elements causing exceptions',
      () async {
    var input = Stream.fromIterable([2, 4, 6])
        .map((n) => throw Exception('Even number'));
    var result = await streamExceptionHandling(input);
    expect(result, isEmpty);
  });

  test('streamExceptionHandling handles an empty stream', () async {
    var input = Stream<int>.empty();
    var result = await streamExceptionHandling(input);
    expect(result, isEmpty);
  });
}

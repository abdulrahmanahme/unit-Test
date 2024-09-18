import 'package:counter_test/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  ///Pretest
  setUp((){});
  setUpAll((){});

/// Testing 
  group('Test Counter class', () {
    test('Test counter is value is equal to 0', () {
      ///Assert
      Counter counter = Counter();

      /// Act
      var value = counter.counter;

      /// Assert
      expect(value, 0);
    });

    test('Test counter is increment function is increment ', () {
      ///Assert
      Counter counter = Counter();
      /// Act
      counter.increment();
      var value = counter.counter;
      /// Assert
      expect(value, 1);
    });
  });

    ///Post Test
  tearDown((){});
  tearDownAll((){});
}

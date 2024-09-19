import 'package:counter_test/model/repos/counter_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
    late  CounterRepository counter ;

  ///Pretest
  setUp(() {
   counter = CounterRepository();
  });
  setUpAll(() {
  });

  /// set up is called before every test
  /// set up all is called before all test
  /// set up -> test-> set up ->test
  /// set up all -> test -> test-> test

  /// Testing
  group('Test Counter class', () {
    test('Test counter is value is equal to 0', () {
      ///Assert

      /// Act
      var value = counter.counter;

      /// Assert
      expect(value, 0);
    });

    test('Test counter is increment function is increment ', () {
      ///Assert

      /// Act
      counter.increment();
      var value = counter.counter;

      /// Assert
      expect(value, 1);
    });


     test('Test counter is reset function to 0 ', () {
      ///Assert

      /// Act
      counter.reset();
      var value = counter.counter;

      /// Assert
      expect(value, 0);
    });
  });

  ///Post Test because is called after testing

  ///called after every single test
  tearDown(() {});
  /// called after all test
  tearDownAll(() {});
  /// tearDown -> test-> set up ->test
  /// tearDownAll ->test ->test->test
}

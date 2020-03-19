import 'package:rxdart/rxdart.dart';

class CounterModel {
  BehaviorSubject _counter = BehaviorSubject.seeded(0);

  get stream$ => _counter.stream;

  int get current => _counter.value;

  increment() {
    _counter.add(current + 1);
  }

  decrement() {
    _counter.add(current - 1);
  }
}

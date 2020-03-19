import 'dart:async';

import 'package:counterstatemanagement/counter_event.dart';
import 'package:rxdart/rxdart.dart';

class CounterBloc {
  int _counter = 0;

  final _counterSubject = BehaviorSubject<int>();

  Stream<int> get counter => _counterSubject.stream;

  final _counterEventController = StreamController<CounterEvent>();

  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;

  CounterBloc() {
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event) {
    if (event is IncrementEvent) {
      _counter++;
    } else if (event is DecrementEvent) {
      _counter--;
    }
    _counterSubject.add(_counter);
  }

  void dispose() {
    _counterSubject.close();
    _counterEventController.close();
  }
}

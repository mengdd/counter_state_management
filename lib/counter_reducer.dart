import 'package:counterstatemanagement/counter_actions.dart';
import 'package:counterstatemanagement/counter_state.dart';

CounterState reducer(CounterState prev, dynamic action) {
  if (action == Actions.Increment) {
    return new CounterState(prev.counter + 1);
  } else if (action == Actions.Decrement) {
    return new CounterState(prev.counter - 1);
  } else {
    return prev;
  }
}

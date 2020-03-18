import 'package:flutter/cupertino.dart';

class CounterModel {
  final ValueNotifier<int> counter = ValueNotifier(0);

  void increment() {
    counter.value++;
  }

  void decrement() {
    counter.value--;
  }
}

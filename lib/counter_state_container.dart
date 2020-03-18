import 'package:counterstatemanagement/counter_model.dart';
import 'package:flutter/widgets.dart';

class CounterStateContainer extends InheritedWidget {
  final CounterModel data;

  CounterStateContainer({
    Key key,
    @required Widget child,
    @required this.data,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(CounterStateContainer oldWidget) {
    return data.counter.value != oldWidget.data.counter.value;
  }

  static CounterModel of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<CounterStateContainer>()
        .data;
  }
}

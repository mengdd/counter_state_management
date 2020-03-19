import 'package:counterstatemanagement/counter_bloc.dart';
import 'package:flutter/widgets.dart';

class CounterProvider extends InheritedWidget {
  final CounterBloc cartBloc;

  CounterProvider({
    Key key,
    CounterBloc cartBloc,
    Widget child,
  })  : cartBloc = cartBloc ?? CounterBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static CounterBloc of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<CounterProvider>().cartBloc;
}

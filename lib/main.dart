import 'package:counterstatemanagement/counter_actions.dart' as action;
import 'package:counterstatemanagement/counter_reducer.dart';
import 'package:counterstatemanagement/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final store = Store<CounterState>(reducer, initialState: CounterState(0));

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StoreConnector<CounterState, String>(
              converter: (store) => store.state.counter.toString(),
              builder: (context, count) {
                return Text(
                  '$count',
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          StoreConnector<CounterState, VoidCallback>(
            converter: (store) {
              return () => store.dispatch(action.Actions.Increment);
            },
            builder: (context, callback) {
              return FloatingActionButton(
                onPressed: callback,
                tooltip: 'Increment',
                child: Icon(Icons.add),
              );
            },
          ),
          SizedBox(
            height: 16,
          ),
          StoreConnector<CounterState, VoidCallback>(
            converter: (store) {
              return () => store.dispatch(action.Actions.Decrement);
            },
            builder: (context, callback) {
              return FloatingActionButton(
                onPressed: callback,
                tooltip: 'Decrement',
                child: Icon(Icons.remove),
              );
            },
          ),
        ],
      ),
    );
  }
}

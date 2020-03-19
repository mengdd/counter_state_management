import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (ctx, StateSetter setState) {
      return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () => setState(() => _counter++),
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
            SizedBox(
              height: 16,
            ),
            FloatingActionButton(
              onPressed: () => setState(() => _counter--),
              tooltip: 'Decrement',
              child: Icon(Icons.remove),
            ),
          ],
        ),
      );
    });
  }
}

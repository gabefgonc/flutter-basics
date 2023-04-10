import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<StatefulWidget> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final _history = <String>[];
  var _counter = 0;

  void _increment() {
    var now = DateTime.now();
    var formatter = DateFormat('dd/MM/yyyy - HH:mm');
    String formattedDate = formatter.format(now);
    setState(() {
      _counter++;
      _history.add('$formattedDate: Increased Counter');
    });
  }

  void _decrement() {
    var now = DateTime.now();
    var formatter = DateFormat('dd/MM/yyyy - HH:mm');
    String formattedDate = formatter.format(now);
    setState(() {
      _counter--;
      _history.add('$formattedDate: Decreased Counter');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.purple,
      home: Scaffold(
        appBar: AppBar(title: const Text('My first flutter app')),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemExtent: 50,
                  itemBuilder: (context, index) => Text(
                        _history[index],
                        style: const TextStyle(fontSize: 19.0),
                      ),
                  itemCount: _history.length),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: _decrement,
                    child: Text('-1',
                        style:
                            TextStyle(color: Colors.red[600], fontSize: 32))),
                Text('$_counter', style: const TextStyle(fontSize: 32)),
                TextButton(
                    onPressed: _increment,
                    child: Text('+1',
                        style:
                            TextStyle(color: Colors.green[600], fontSize: 32))),
              ],
            )
          ],
        ),
      ),
    );
  }
}

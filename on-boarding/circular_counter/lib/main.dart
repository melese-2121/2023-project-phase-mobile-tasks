import 'package:flutter/material.dart';

void main() => runApp(const CircularCounterApp());

class CircularCounterApp extends StatelessWidget {
  const CircularCounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CircularCounterScreen(),
    );
  }
}

class CircularCounterScreen extends StatefulWidget {
  const CircularCounterScreen({Key? key}) : super(key: key);

  @override
  _CircularCounterScreenState createState() => _CircularCounterScreenState();
}

class _CircularCounterScreenState extends State<CircularCounterScreen> {
  int _counter = 0;

  void _updateCounter(bool increment) {
    setState(() {
      _counter = increment
          ? (_counter + 1) % 11
          : (_counter - 1) < 0
              ? 10
              : _counter - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Circular Counter',
        )),
        titleTextStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        backgroundColor: Colors.cyan[800],
      ),
      body: Center(
        child: CounterWidget(
          counter: _counter,
          onIncrement: () => _updateCounter(true),
          onDecrement: () => _updateCounter(false),
        ),
      ),
    );
  }
}

class CounterWidget extends StatelessWidget {
  final int counter;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CounterWidget({
    Key? key,
    required this.counter,
    required this.onIncrement,
    required this.onDecrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text('Counter Value:', style: TextStyle(fontSize: 20)),
        const SizedBox(height: 20),
        Text('$counter',
            style: const TextStyle(fontSize: 80, fontWeight: FontWeight.bold)),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: onIncrement,
                icon: const Icon(Icons.add, color: Colors.white),
                tooltip: 'Increment',
                iconSize: 30,
              ),
            ),
            const SizedBox(width: 20),
            Container(
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: onDecrement,
                icon: const Icon(Icons.remove, color: Colors.white),
                tooltip: 'Decrement',
                iconSize: 30,
              ),
            ),
          ],
        )
      ],
    );
  }
}

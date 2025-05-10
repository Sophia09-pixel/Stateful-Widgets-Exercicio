import 'package:flutter/material.dart';
import 'package:praticando_stateful/build-color-slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _iconSize = 250;
  int _red = 0;
  int _green = 0;
  int _blue = 0;

  void _setSize(double newSize) {
    setState(() {
      _iconSize = newSize.clamp(10, 400);
    });
  }

  void _changeSizeBy(double delta) {
    setState(() {
      _iconSize = (_iconSize + delta).clamp(10, 400);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter State'),
        actions: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () => _changeSizeBy(-10),
          ),
          IconButton(icon: const Text('S'), onPressed: () => _setSize(100)),
          IconButton(icon: const Text('M'), onPressed: () => _setSize(200)),
          IconButton(icon: const Text('L'), onPressed: () => _setSize(300)),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _changeSizeBy(10),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Icon(
                Icons.lock_clock,
                size: _iconSize,
                color: Color.fromRGBO(_red, _green, _blue, 1),
              ),
            ),
          ),
          BuildColorSlider(
            label: 'R',
            value: _red.toDouble(),
            color: Colors.red,
            onChanged: (value) {
              setState(() {
                _red = value.toInt();
              });
            },
          ),
          BuildColorSlider(
            label: 'G',
            value: _green.toDouble(),
            color: Colors.green,
            onChanged: (value) {
              setState(() {
                _green = value.toInt();
              });
            },
          ),
          BuildColorSlider(
            label: 'B',
            value: _blue.toDouble(),
            color: Colors.blue,
            onChanged: (value) {
              setState(() {
                _blue = value.toInt();
              });
            },
          ),
        ],
      ),
    );
  }
}

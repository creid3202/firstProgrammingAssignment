import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Calorie Counter App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 34, 78, 255)),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var rng = Random();
  var curr = 0;

  void getNext() {
    curr = rng.nextInt(3000);
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      body: Column(
        children: [
          Text('Calorie Counter'),
          Text('Click to add more calories.'),
          Text(appState.curr.toString()),

          ElevatedButton(
            onPressed: () {
              //print('Calories Added!');
              appState.getNext();
            },
            child: Text('Next'),
          ),

        ],
      ),
    );
  }
}
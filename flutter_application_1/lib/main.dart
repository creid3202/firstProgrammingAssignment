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
          colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 81, 132, 209)),
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
    var randomCalorie = appState.curr;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Calorie Counter'),
            Text('Click Next to add more calories.'),
            CalorieNum(randomCalorie: randomCalorie),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                //print('Calories Added!');
                appState.getNext();
              },
              child: Text('Next'),
            ),
      
          ],
        ),
      ),
    );
  }
}

class CalorieNum extends StatelessWidget {
  const CalorieNum({
    super.key,
    required this.randomCalorie,
  });

  final int randomCalorie;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context); 
    var style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(60),
        child: Text(randomCalorie.toString(), style:style),
      ),
    );
  }
}
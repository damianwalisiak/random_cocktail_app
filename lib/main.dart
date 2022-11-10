import 'package:flutter/material.dart';

void main() {
  runApp(const RandomCocktailApp());
}

class RandomCocktailApp extends StatelessWidget {
  const RandomCocktailApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Cocktail',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const Scaffold(),
    );
  }
}

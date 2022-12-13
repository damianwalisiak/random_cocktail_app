import 'package:flutter/material.dart';
import 'package:random_cocktail_app/features/home/pages/home_page.dart';

void main() {
  runApp(
    const RandomCocktailApp(),
  );
}

class RandomCocktailApp extends StatelessWidget {
  const RandomCocktailApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Cocktail',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.pink,
      ),
      home: const HomePage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_cocktail_app/features/home/pages/home_page.dart';
import 'package:random_cocktail_app/features/search_details/cubit/search_details_cubit.dart';

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

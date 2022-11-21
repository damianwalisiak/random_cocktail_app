import 'package:flutter/material.dart';
import 'package:random_cocktail_app/domain/models/cocktail_model.dart';
import 'package:random_cocktail_app/features/home/pages/home_page.dart';

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
        brightness: Brightness.dark,
        primarySwatch: Colors.pink,
      ),
      home: HomePage(
        cocktailModel: CocktailModel(
          name: 'cocktailModel.name',
          category: 'category',
          alcoholic: 'alcoholic',
          glassType: 'glassType',
          pictureUrl: 'pictureUrl',
          instructions: 'instructions',
          // cocktailName: cocktailName,
          ingredients: [],
        ),
      ),
    );
  }
}

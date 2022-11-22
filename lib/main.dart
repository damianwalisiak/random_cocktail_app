import 'package:flutter/material.dart';
import 'package:random_cocktail_app/domain/models/cocktail_model.dart';
import 'package:random_cocktail_app/features/home/pages/home_page.dart';

void main() {
  runApp(
    RandomCocktailApp(
      cocktailModel: CocktailModel(
        name: 'cocktailModel.name',
        category: 'cocktailModel.category',
        alcoholic: 'cocktailModel.alcoholic',
        glassType: 'cocktailModel.glassType',
        pictureUrl: 'cocktailModel.pictureUrl',
        instructions: 'cocktailModel.instructions',
        // cocktailName: cocktailName,
        ingredients: [],
      ),
    ),
  );
}

class RandomCocktailApp extends StatelessWidget {
  const RandomCocktailApp({
    Key? key,
    required this.cocktailModel,
  }) : super(key: key);

  final CocktailModel cocktailModel;

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
          name: cocktailModel.name,
          category: cocktailModel.category,
          alcoholic: cocktailModel.alcoholic,
          glassType: cocktailModel.glassType,
          pictureUrl: cocktailModel.pictureUrl,
          instructions: cocktailModel.instructions,
          // cocktailName: cocktailName,
          ingredients: cocktailModel.ingredients,
        ),
      ),
    );
  }
}

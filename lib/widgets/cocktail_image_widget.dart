import 'package:flutter/material.dart';
import 'package:random_cocktail_app/domain/models/cocktail_model.dart';
import 'package:random_cocktail_app/widgets/details_widget.dart';

class CocktailImage extends StatelessWidget {
  const CocktailImage({
    Key? key,
    required this.cocktailModel,
    required this.shadowColor,
  }) : super(key: key);

  final CocktailModel? cocktailModel;
  final Color shadowColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          if (cocktailModel!.pictureUrl.isNotEmpty)
            //image cocktail
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              child: Image(
                image: NetworkImage(cocktailModel!.pictureUrl),
                fit: BoxFit.cover,
              ),
            ),
          //Details of cocktail
          DetailsCocktail(
            cocktailModel: cocktailModel,
            shadowColor: shadowColor,
          ),
        ],
      ),
    );
  }
}

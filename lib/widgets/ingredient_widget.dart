import 'package:flutter/material.dart';
import 'package:random_cocktail_app/constants.dart';
import 'package:random_cocktail_app/domain/models/ingredient_model.dart';

class IngredientWidget extends StatelessWidget {
  const IngredientWidget({super.key, required this.ingredientsList});

  final List<IngredientModel> ingredientsList;

  Widget createIngredientTable() {
    List<TableRow> rows = [];

    for (int i = 0; i < ingredientsList.length; i++) {
      rows.add(
        TableRow(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ingredientsList[i].name,
                  style: TextStyle(
                    color: kNormalTextColor.withOpacity(0.8),
                    fontSize: 18,
                    fontFamily: 'NotoSans-Regular',
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.none,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  ingredientsList[i].mesure,
                  style: TextStyle(
                    color: kNormalTextColor.withOpacity(0.8),
                    fontSize: 18,
                    fontFamily: 'NotoSans-Regular',
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.none,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ],
        ),
      );
    }
    return Table(children: rows);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        left: 40,
        right: 40,
        bottom: 20,
      ),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white10,
        border: Border.all(
          color: kBorderColor.withOpacity(0.9),
          width: 6,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: kShadowColor,
            blurRadius: 12,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Column(
        children: [
          //Title of box
          const Text(
            'Ingredients',
            style: TextStyle(
              color: kBorderColor,
              fontFamily: 'NotoSans-Regular',
              fontSize: 24,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.none,
              shadows: [
                Shadow(
                  color: kShadowColor,
                  blurRadius: 3,
                ),
                Shadow(
                  color: kShadowColor,
                  blurRadius: 6,
                ),
                Shadow(
                  color: kShadowColor,
                  blurRadius: 9,
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          createIngredientTable(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:random_cocktail_app/constants.dart';

class SearchText extends StatelessWidget {
  const SearchText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "You don't wanna go crazy?\n Enter a name for your drink:",
      style: TextStyle(
        fontSize: 24,
        color: kNormalTextColor.withOpacity(0.8),
        fontFamily: 'NotoSans-Italic',
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.none,
      ),
      textAlign: TextAlign.center,
    );
  }
}

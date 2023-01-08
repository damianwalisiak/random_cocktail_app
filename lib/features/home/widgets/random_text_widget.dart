import 'package:flutter/material.dart';
import 'package:random_cocktail_app/app/core/constants.dart';

class RandomText extends StatelessWidget {
  const RandomText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Let's check what cocktail \nyou should drink!",
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

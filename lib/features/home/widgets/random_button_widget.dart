import 'package:flutter/material.dart';
import 'package:random_cocktail_app/app/core/constants.dart';
import 'package:random_cocktail_app/features/random_details/pages/random_details_page.dart';

class RandomButton extends StatelessWidget {
  const RandomButton({
    Key? key,
    required this.isPressed,
    required this.backgroundColor,
    required this.shadowColor,
  }) : super(key: key);

  final bool isPressed;
  final Color backgroundColor;
  final Color shadowColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isPressed ? backgroundColor : null,
        boxShadow: [
          for (double i = 1; i < 5; i++)
            BoxShadow(
              spreadRadius: -1,
              color: shadowColor,
              blurRadius: (isPressed ? 5 : 3) * i,
              blurStyle: BlurStyle.outer,
            )
        ],
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          side: const BorderSide(color: kBorderColor, width: 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const RandomDetailsPage(),
            ),
          );
        },
        child: Text(
          ' Find out! ',
          style: TextStyle(
            fontSize: 34,
            color: kBorderColor,
            fontFamily: 'Neon',
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.none,
            shadows: [
              for (double i = 1; i < (isPressed ? 8 : 4); i++)
                Shadow(
                  color: shadowColor,
                  blurRadius: 3 * i,
                )
            ],
          ),
        ),
      ),
    );
  }
}

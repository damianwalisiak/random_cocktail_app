import 'package:flutter/material.dart';
import 'package:random_cocktail_app/app/core/constants.dart';

class InstructionWidget extends StatelessWidget {
  const InstructionWidget({required this.instructions, super.key});

  final String instructions;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        left: 30,
        right: 30,
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
          const Text(
            'Instructions',
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
          Text(
            instructions,
            style: TextStyle(
              color: kNormalTextColor.withOpacity(0.8),
              fontFamily: 'NotoSans-Regular',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.none,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

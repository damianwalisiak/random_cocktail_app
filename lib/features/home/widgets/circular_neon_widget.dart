import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text/model.dart';
import 'package:flutter_circular_text/circular_text/widget.dart';
import 'package:random_cocktail_app/constants.dart';

class CircularNeonText extends StatelessWidget {
  const CircularNeonText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: Align(
        alignment: Alignment.center,
        child: CircularText(
          children: [
            TextItem(
                text: Text(
                  'Random Cocktail'.toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'Neon',
                    fontSize: 45,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..color = kNormalTextColor
                      ..strokeWidth = 2,
                    shadows: const [
                      Shadow(
                        color: kShadowColor,
                        blurRadius: 10.0,
                        offset: Offset(5, 2),
                      ),
                    ],
                  ),
                ),
                space: 12,
                startAngle: -88,
                startAngleAlignment: StartAngleAlignment.center,
                direction: CircularTextDirection.clockwise),
          ],
          radius: 130,
          position: CircularTextPosition.outside,
        ),
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:random_cocktail_app/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isPressed = false;
  bool isPressedSearch = false;

  @override
  Widget build(BuildContext context) {
    Color shadowColor = kShadowColor;
    Color backgroundColor = shadowColor.withOpacity(0.7);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0, 1),
            tileMode: TileMode.mirror,
            colors: <Color>[
              kBackgroundColor1,
              kBackgroundColor2,
            ],
          ),
        ),
        child: Expanded(
          child: ListView(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 70,
                      ),
                      //logo image/TODO rive animation
                      const Image(
                        image: AssetImage('images/drink.png'),
                        width: 200,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //Text to random button
                      Text(
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
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //Random Button
                      Listener(
                        onPointerDown: (_) => setState(() {
                          isPressed = true;
                        }),
                        onPointerUp: (_) => setState(() {
                          isPressed = false;
                        }),
                        //Random Button properites
                        child: Container(
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
                              side: const BorderSide(
                                  color: kBorderColor, width: 4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              ' Find out! ',
                              style: TextStyle(
                                fontSize: 34,
                                color: kBorderColor,
                                fontFamily: 'Neon',
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.none,
                                shadows: [
                                  for (double i = 1;
                                      i < (isPressed ? 8 : 4);
                                      i++)
                                    Shadow(
                                      color: shadowColor,
                                      blurRadius: 3 * i,
                                    )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      //Text to search button
                      Text(
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
                      ),
                      //TextField
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: TextField(
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            hintText: 'e.g. Zombie',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: kBorderColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      //Search button
                      Listener(
                        onPointerDown: (_) => setState(() {
                          isPressedSearch = true;
                        }),
                        onPointerUp: (_) => setState(() {
                          isPressedSearch = false;
                        }),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: isPressedSearch ? backgroundColor : null,
                            boxShadow: [
                              for (double i = 1; i < 5; i++)
                                BoxShadow(
                                  spreadRadius: -1,
                                  color: shadowColor,
                                  blurRadius: (isPressedSearch ? 5 : 3) * i,
                                  blurStyle: BlurStyle.outer,
                                )
                            ],
                          ),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              side: const BorderSide(
                                  color: kBorderColor, width: 4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              ' Search ',
                              style: TextStyle(
                                fontSize: 34,
                                color: kBorderColor,
                                fontFamily: 'Neon',
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.none,
                                shadows: [
                                  for (double i = 1;
                                      i < (isPressedSearch ? 8 : 4);
                                      i++)
                                    Shadow(
                                      color: shadowColor,
                                      blurRadius: 3 * i,
                                    )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //Neon text
                  Padding(
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
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

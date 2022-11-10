import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:random_cocktail_app/constants.dart';
import 'package:random_cocktail_app/widgets/ingredient_widget.dart';
import 'package:random_cocktail_app/widgets/instruction_widget.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    Color shadowColor = kShadowColor;
    return Scaffold(
      //AppBar look
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          size: 40,
          color: kBorderColor,
          shadows: [
            for (double i = 1; i < (isPressed ? 8 : 4); i++)
              Shadow(
                color: shadowColor,
                blurRadius: 6 * i,
              ),
          ],
        ),
        leading: const BackButton(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.replay_outlined,
            ),
          ),
        ],
      ),
      //Gradient background
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0, 1),
            colors: <Color>[
              kBackgroundColor1,
              kBackgroundColor2,
            ],
            tileMode: TileMode.mirror,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 550,
              child: Stack(
                fit: StackFit.passthrough,
                children: [
                  //image cocktail
                  const ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(
                          40,
                        )),
                    child: Image(
                      image: AssetImage('images/cocktail.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  //Details of cocktail
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(40),
                        ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 10,
                            sigmaY: 10,
                          ),
                          child: Container(
                            color: Colors.white10,
                            child: Padding(
                              padding: const EdgeInsets.all(30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Gin & Tonic',
                                        style: TextStyle(
                                          color: kBorderColor,
                                          fontFamily: 'NotoSans-Regular',
                                          fontSize: 34,
                                          fontWeight: FontWeight.w600,
                                          decoration: TextDecoration.none,
                                          shadows: [
                                            Shadow(
                                              color: shadowColor,
                                              blurRadius: 5,
                                            ),
                                            Shadow(
                                              color: shadowColor,
                                              blurRadius: 10,
                                            ),
                                            Shadow(
                                              color: shadowColor,
                                              blurRadius: 30,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4),
                                        child: Text(
                                          'category • alcoholic',
                                          style: TextStyle(
                                            color:
                                                kBorderColor.withOpacity(0.7),
                                            fontFamily: 'NotoSans-Regular',
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Column(
                                          children: [
                                            Icon(
                                              Icons.local_bar_rounded,
                                              color:
                                                  kBorderColor.withOpacity(0.7),
                                            ),
                                            Text(
                                              'Glass type',
                                              style: TextStyle(
                                                color: kBorderColor
                                                    .withOpacity(0.7),
                                                fontFamily: 'NotoSans-Reguular',
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                decoration: TextDecoration.none,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //Ingredient box
            const IngredientWidget(
              ingredientList: [],
            ),
            //Instrucction Box
            const InstructionWidget(instructions: 'instructions')
          ],
        ),
      ),
    );
  }
}

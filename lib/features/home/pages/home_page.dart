import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:random_cocktail_app/app/core/enums.dart';
import 'package:random_cocktail_app/constants.dart';
import 'package:random_cocktail_app/domain/models/cocktail_model.dart';
import 'package:random_cocktail_app/domain/repositories/random_cocktail_repository.dart';
import 'package:random_cocktail_app/features/home/cubit/home_cubit.dart';
import 'package:random_cocktail_app/features/random_details/pages/random_details_page.dart';
import 'package:random_cocktail_app/features/search_details/pages/search_details_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isPressed = false;
  bool isPressedSearch = false;
  String? cocktailName;
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Color shadowColor = kShadowColor;
    Color backgroundColor = shadowColor.withOpacity(0.7);

    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocListener<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state.status == Status.error) {
            final errorMessage = state.errorMessage ?? 'Unkown error';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final cocktailModel = state.model;
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
                              //logo image

                              //TODO rive animation
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
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (_) => RandomDetailsPage(
                                            cocktailModel: CocktailModel(
                                              name: 'name',
                                              category: 'category',
                                              alcoholic: 'alcooholic',
                                              glassType: 'glassType',
                                              pictureUrl: 'pictureUrl',
                                              instructions: 'instructions',
                                            ),
                                          ),
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
                                  onChanged: (value) {
                                    cocktailName = value;
                                  },
                                  controller: _controller,
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
                                    color: isPressedSearch
                                        ? backgroundColor
                                        : null,
                                    boxShadow: [
                                      for (double i = 1; i < 5; i++)
                                        BoxShadow(
                                          spreadRadius: -1,
                                          color: shadowColor,
                                          blurRadius:
                                              (isPressedSearch ? 5 : 3) * i,
                                          blurStyle: BlurStyle.outer,
                                        )
                                    ],
                                  ),
                                  child: TextButton(
                                    onPressed: () async {
                                      if (cocktailName == null) return;
                                      cocktailName!
                                          .toLowerCase()
                                          .replaceAll(' ', '_');
                                      var _controler = await cocktailName;
                                      // context.read<HomeCubit>().getCocktailModel(
                                      //     cocktailName: _controler);
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (_) => SearchDetailsPage(),
                                        ),
                                      );
                                    },
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
                                      startAngleAlignment:
                                          StartAngleAlignment.center,
                                      direction:
                                          CircularTextDirection.clockwise),
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
          },
        ),
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:random_cocktail_app/constants.dart';
import 'package:random_cocktail_app/domain/models/cocktail_model.dart';

class DetailsCocktail extends StatelessWidget {
  const DetailsCocktail({
    Key? key,
    required this.cocktailModel,
    required this.shadowColor,
  }) : super(key: key);

  final CocktailModel? cocktailModel;
  final Color shadowColor;

  @override
  Widget build(BuildContext context) {
    return Column(
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
              child: Container(
                color: const Color.fromARGB(255, 68, 2, 60).withOpacity(0.5),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                    left: 30,
                    right: 25,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cocktailModel!.name,
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
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cocktailModel!.category,
                                style: const TextStyle(
                                  color: kBorderColor,
                                  fontFamily: 'NotoSans-Regular',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                cocktailModel!.alcoholic,
                                style: const TextStyle(
                                  color: kBorderColor,
                                  fontFamily: 'NotoSans-Regular',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                const Icon(
                                  Icons.local_bar_rounded,
                                  color: kBorderColor,
                                ),
                                Text(
                                  cocktailModel!.glassType,
                                  style: const TextStyle(
                                    color: kBorderColor,
                                    fontFamily: 'NotoSans-Reguular',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.none,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

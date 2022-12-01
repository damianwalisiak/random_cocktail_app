import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_cocktail_app/app/core/enums.dart';
import 'package:random_cocktail_app/app/data/remote_data_sources/search_remote_data_source.dart';
import 'package:random_cocktail_app/constants.dart';
import 'package:random_cocktail_app/domain/repositories/search_cocktail_repository.dart';
import 'package:random_cocktail_app/features/search_details/cubit/search_details_cubit.dart';
import 'package:random_cocktail_app/widgets/ingredient_widget.dart';
import 'package:random_cocktail_app/widgets/instruction_widget.dart';

class SearchDetailsPage extends StatefulWidget {
  const SearchDetailsPage({
    Key? key,
    required this.cocktailName,
  }) : super(key: key);

  final String cocktailName;

  @override
  State<SearchDetailsPage> createState() => _SearchDetailsPageState();
}

class _SearchDetailsPageState extends State<SearchDetailsPage> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    Color shadowColor = kShadowColor;
    return BlocProvider(
      create: (context) => SearchDetailsCubit(
        SearchCocktailRepository(SearchRemoteDataSource()),
      )..getCocktailModel(cocktailName: widget.cocktailName),
      child: BlocListener<SearchDetailsCubit, SearchDetailsState>(
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
        child: BlocBuilder<SearchDetailsCubit, SearchDetailsState>(
          builder: (context, state) {
            final cocktailModel = state.model[0];
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
                    //TODO implement search cocktails
                    onPressed: () {},

                    icon: const Icon(
                      Icons.search,
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
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(40),
                                bottomRight: Radius.circular(
                                  40,
                                )),
                            child: Image(
                              image: AssetImage('images/cocktail.jpg'),
                              // image: NetworkImage(cocktailModel.pictureUrl),
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
                                                cocktailModel.name,
                                                style: TextStyle(
                                                  color: kBorderColor,
                                                  fontFamily:
                                                      'NotoSans-Regular',
                                                  fontSize: 34,
                                                  fontWeight: FontWeight.w600,
                                                  decoration:
                                                      TextDecoration.none,
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
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 4,
                                                ),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      cocktailModel.category,
                                                      style: TextStyle(
                                                        color: kBorderColor
                                                            .withOpacity(0.7),
                                                        fontFamily:
                                                            'NotoSans-Regular',
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        decoration:
                                                            TextDecoration.none,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 12),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Column(
                                                  children: [
                                                    Icon(
                                                      Icons.local_bar_rounded,
                                                      color: kBorderColor
                                                          .withOpacity(0.7),
                                                    ),
                                                    Text(
                                                      cocktailModel.glassType,
                                                      style: TextStyle(
                                                        color: kBorderColor
                                                            .withOpacity(0.7),
                                                        fontFamily:
                                                            'NotoSans-Reguular',
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        decoration:
                                                            TextDecoration.none,
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
                    IngredientWidget(
                      ingredientsList: cocktailModel.ingredientsList,
                    ),
                    //Instrucction Box
                    InstructionWidget(
                      instructions: cocktailModel.instructions,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

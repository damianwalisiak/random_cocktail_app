import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_cocktail_app/app/core/enums.dart';
import 'package:random_cocktail_app/app/data/remote_data_sources/random_remote_data_source.dart';
import 'package:random_cocktail_app/constants.dart';
import 'package:random_cocktail_app/domain/repositories/random_cocktail_repository.dart';
import 'package:random_cocktail_app/features/home/pages/home_page.dart';
import 'package:random_cocktail_app/features/random_details/cubit/random_details_cubit.dart';
import 'package:random_cocktail_app/widgets/ingredient_widget.dart';
import 'package:random_cocktail_app/widgets/instruction_widget.dart';

class RandomDetailsPage extends StatefulWidget {
  const RandomDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<RandomDetailsPage> createState() => _RandomDetailsPageState();
}

class _RandomDetailsPageState extends State<RandomDetailsPage> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    Color shadowColor = kShadowColor;
    return BlocProvider(
      create: (context) => RandomDetailsCubit(
        RandomCocktailRepository(
          RandomRemoteDataSource(),
        ),
      )..getCocktailModel(),
      child: BlocListener<RandomDetailsCubit, RandomDetailsState>(
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
        child: BlocBuilder<RandomDetailsCubit, RandomDetailsState>(
          builder: (context, state) {
            switch (state.status) {
              case Status.initial:
                return const Center(
                  child: Text('Initial state'),
                );
              case Status.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case Status.error:
                return Center(
                  child: Text(
                    state.errorMessage ?? 'Unknown error',
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                );
              case Status.success:
                final cocktailModel = state.model;

                if (cocktailModel == null) {
                  return const CircularProgressIndicator();
                }

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
                    leading: Builder(builder: (BuildContext context) {
                      return IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new_outlined),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const HomePage(),
                              ),
                            );
                          });
                    }),
                    actions: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const RandomDetailsPage(),
                            ),
                          );
                        },
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
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(40),
                                    bottomRight: Radius.circular(
                                      40,
                                    )),
                                child: Image(
                                  image: NetworkImage(
                                    cocktailModel.pictureUrl,
                                  ),
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
                                        child: Container(
                                          color: const Color.fromARGB(
                                                  255, 68, 2, 60)
                                              .withOpacity(0.5),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              top: 20,
                                              bottom: 20,
                                              left: 30,
                                              right: 30,
                                            ),
                                            child: Flexible(
                                              child: Column(
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
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            cocktailModel
                                                                .category,
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  kBorderColor,
                                                              fontFamily:
                                                                  'NotoSans-Regular',
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              decoration:
                                                                  TextDecoration
                                                                      .none,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            cocktailModel
                                                                .alcoholic,
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  kBorderColor,
                                                              fontFamily:
                                                                  'NotoSans-Regular',
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              decoration:
                                                                  TextDecoration
                                                                      .none,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          const Icon(
                                                            Icons
                                                                .local_bar_rounded,
                                                            color: kBorderColor,
                                                          ),
                                                          Text(
                                                            cocktailModel
                                                                .glassType,
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  kBorderColor,
                                                              fontFamily:
                                                                  'NotoSans-Reguular',
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              decoration:
                                                                  TextDecoration
                                                                      .none,
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
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
                        //Instruction Box
                        InstructionWidget(
                          instructions: cocktailModel.instructions,
                        )
                      ],
                    ),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_cocktail_app/app/core/enums.dart';
import 'package:random_cocktail_app/app/data/remote_data_sources/search_remote_data_source.dart';
import 'package:random_cocktail_app/constants.dart';
import 'package:random_cocktail_app/domain/models/cocktail_model.dart';
import 'package:random_cocktail_app/domain/repositories/search_cocktail_repository.dart';
import 'package:random_cocktail_app/features/home/pages/home_page.dart';
import 'package:random_cocktail_app/features/search_details/cubit/search_details_cubit.dart';
import 'package:random_cocktail_app/widgets/details_widget.dart';
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
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(40),
                                ),
                                child: Image(
                                  image: NetworkImage(cocktailModel.pictureUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              //Details of cocktail
                              DetailsCocktail(
                                cocktailModel: cocktailModel,
                                shadowColor: shadowColor,
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
            }
          },
        ),
      ),
    );
  }
}

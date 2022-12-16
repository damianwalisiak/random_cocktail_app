import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_cocktail_app/app/core/enums.dart';
import 'package:random_cocktail_app/app/data/remote_data_sources/random_remote_data_source.dart';
import 'package:random_cocktail_app/constants.dart';
import 'package:random_cocktail_app/domain/repositories/random_cocktail_repository.dart';
import 'package:random_cocktail_app/features/random_details/cubit/random_details_cubit.dart';
import 'package:random_cocktail_app/widgets/cocktail_image_widget.dart';
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
        child: Scaffold(
          body: BlocBuilder<RandomDetailsCubit, RandomDetailsState>(
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
                              Navigator.pop(context);
                            });
                      }),
                      actions: [
                        IconButton(
                          onPressed: () {
                            context
                                .read<RandomDetailsCubit>()
                                .getCocktailModel();
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
                          CocktailImage(
                              cocktailModel: cocktailModel,
                              shadowColor: shadowColor),
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
      ),
    );
  }
}

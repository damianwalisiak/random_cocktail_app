import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_cocktail_app/app/core/enums.dart';
import 'package:random_cocktail_app/app/data/remote_data_sources/search_remote_data_source.dart';
import 'package:random_cocktail_app/constants.dart';
import 'package:random_cocktail_app/domain/repositories/search_cocktail_repository.dart';
import 'package:random_cocktail_app/features/home/pages/home_page.dart';
import 'package:random_cocktail_app/features/search_details/cubit/search_details_cubit.dart';
import 'package:random_cocktail_app/widgets/cocktail_image_widget.dart';
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
    return Scaffold(
      body: BlocProvider(
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
                  return const HomePage();
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
                          splashRadius: 28,
                          splashColor: kShadowColor,
                          icon: const Icon(
                            Icons.arrow_back_ios_new_outlined,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        );
                      }),
                      actions: [
                        IconButton(
                          splashRadius: 28,
                          splashColor: kShadowColor,
                          icon: const Icon(
                            Icons.search,
                          ),
                          onPressed: () async {
                            await searchDialog(context);
                          },
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
      ),
    );
  }

  Future<void> searchDialog(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return showDialog(
        context: context,
        builder: (buildContext) {
          return BlocProvider(
            create: (context) => SearchDetailsCubit(
              SearchCocktailRepository(SearchRemoteDataSource()),
            ),
            child: AlertDialog(
              title: const Text(
                'Cocktail name',
                style: TextStyle(
                  color: kShadowColor,
                  fontSize: 22,
                ),
                textAlign: TextAlign.center,
              ),
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: kShadowColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              content: TextField(
                controller: controller,
                style: TextStyle(color: kNormalTextColor.withOpacity(0.9)),
                decoration: InputDecoration(
                  hintText: 'e.g. Vesper',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: kShadowColor,
                    ),
                  ),
                ),
                autofocus: true,
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text(
                    'Dismiss',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  width: 120,
                ),
                TextButton(
                  onPressed: () {
                    if (controller.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text("Drink name can't be empty"),
                        ),
                      );
                    } else {
                      context.read<SearchDetailsCubit>().getCocktailModel(
                          cocktailName: controller.text
                              .toLowerCase()
                              .replaceAll(' ', '_'));
                      Navigator.of(buildContext).pop();
                    }
                    controller.clear();
                  },
                  child: const Text(
                    'Search',
                    style: TextStyle(color: kShadowColor, fontSize: 18),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

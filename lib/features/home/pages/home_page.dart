import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_cocktail_app/constants.dart';
import 'package:random_cocktail_app/features/home/widgets/circular_neon_widget.dart';
import 'package:random_cocktail_app/features/home/widgets/random_button_widget.dart';
import 'package:random_cocktail_app/features/home/widgets/random_text_widget.dart';
import 'package:random_cocktail_app/features/home/widgets/search_button_widget.dart';
import 'package:random_cocktail_app/features/home/widgets/search_text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isPressed = false;
  bool isPressedSearch = false;
  final _controller = TextEditingController();

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
                      const RandomText(),
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
                        child: RandomButton(
                          isPressed: isPressed,
                          backgroundColor: backgroundColor,
                          shadowColor: shadowColor,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      //Text to search button
                      const SearchText(),
                      //TextField
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: TextField(
                          // onChanged: (value) {input = value;},
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
                        child: SearchButton(
                          isPressedSearch: isPressedSearch,
                          backgroundColor: backgroundColor,
                          shadowColor: shadowColor,
                          controller: _controller,
                        ),
                      ),
                    ],
                  ),
                  //Circular neon text
                  const CircularNeonText()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

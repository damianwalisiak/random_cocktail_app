import 'package:flutter/material.dart';
import 'package:random_cocktail_app/app/core/constants.dart';
import 'package:random_cocktail_app/features/search_details/pages/search_details_page.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
    required this.isPressedSearch,
    required this.backgroundColor,
    required this.shadowColor,
    required TextEditingController controller,
  })  : _controller = controller,
        super(key: key);

  final bool isPressedSearch;
  final Color backgroundColor;
  final Color shadowColor;
  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        onPressed: () {
          if (_controller.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text("Drink name can't be empty"),
              ),
            );
          } else {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => SearchDetailsPage(
                  cocktailName:
                      _controller.text.toLowerCase().replaceAll(' ', '_'),
                ),
              ),
            );
          }
        },
        style: TextButton.styleFrom(
          side: const BorderSide(color: kBorderColor, width: 4),
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
              for (double i = 1; i < (isPressedSearch ? 8 : 4); i++)
                Shadow(
                  color: shadowColor,
                  blurRadius: 3 * i,
                )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:al_lover_mer/Themes/colors.dart';
import 'package:flutter/material.dart';

class FlashcardWidget extends StatelessWidget {
  const FlashcardWidget({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg_Home.jpg"), fit: BoxFit.cover)),
              child: Padding(
                padding: EdgeInsets.only(top: 50),
                child: Center(
                  child: Container(

                    height: 500,
                    decoration: BoxDecoration(
                      color: kColorRed,
                      borderRadius: BorderRadius.circular(20),
                    ),
    )))));
  }
}

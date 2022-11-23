import 'package:flutter/material.dart';

class flashcardWidget extends StatelessWidget {
  const flashcardWidget({super.key});
  
  get kColorRed => null;

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
                    width: 350,
                    height: 730,
                    decoration: BoxDecoration(
                      color: kColorRed,
                      borderRadius: BorderRadius.circular(20),
                    ),
    )))));
  }
}

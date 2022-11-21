import 'package:al_lover_mer/Themes/colors.dart';
import 'package:flutter/material.dart';

class FlashcardScreen extends StatefulWidget {
  const FlashcardScreen({super.key});

  @override
  State<FlashcardScreen> createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.jpg"),
                fit: BoxFit.cover)),
                child: Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Center(
                    child: Container(
                        width: 350,
                        height: 730,
                        decoration: BoxDecoration(
                            color: kColorYellow,
                            borderRadius: BorderRadius.circular(20),
                  ),
                      ),
                  ),
                )
      )
      );
      
  }
}

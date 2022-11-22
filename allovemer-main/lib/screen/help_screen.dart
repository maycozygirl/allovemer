import 'package:al_lover_mer/Themes/colors.dart';
import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.jpg"), fit: BoxFit.cover)),
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
              ),
            )),
      ),
    );
  }
}

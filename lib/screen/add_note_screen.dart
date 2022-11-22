import 'package:flutter/material.dart';

import '../Themes/colors.dart';


class AddnoteScreen extends StatefulWidget {
  const AddnoteScreen({super.key});

  @override
  State<AddnoteScreen> createState() => _AddnoteScreenState();
}

class _AddnoteScreenState extends State<AddnoteScreen> {
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
                color: kColorPurple,
                borderRadius: BorderRadius.circular(20),
              ),)
            )
            )
          )
        );
            
  }
}
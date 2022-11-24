import 'package:al_lover_mer/Themes/colors.dart';
import 'package:al_lover_mer/screen/flashcard_flip.dart';
import 'package:al_lover_mer/screen/flashcard_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FlashcardBreak extends StatefulWidget {
  FlashcardBreak({super.key,this.type});
  String? type;

  @override
  State<FlashcardBreak> createState() => _FlashcardBreakState();
}

class _FlashcardBreakState extends State<FlashcardBreak> {
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
                  child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FlashcardText(
                                type: widget.type!,
                              )));
                },
                child: Container(
                  width: 300,
                  height: 100,
                  decoration: BoxDecoration(
                    color: kColorYellow,
                    borderRadius: BorderRadius.circular(150),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 4,
                          offset: Offset(4, 8))
                    ],
                  ),
                  child: Column(
                    children: [
                      Spacer(),
                      Text("เริ่มต้นเล่นเกม",
                          style: TextStyle(
                              fontFamily: "TH-Chara",
                              fontSize: 50,
                              color: Colors.black)),
                      Spacer()
                    ],
                  ),
                ),
              )))),
    );
  }
}

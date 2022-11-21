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
              image: AssetImage("assets/bg.jpg"), fit: BoxFit.cover)),
      child: Padding(
          padding: EdgeInsets.only(top: 100),
          child: Center(
            child: Container(
                width: 350,
                height: 730,
                decoration: BoxDecoration(
                  color: kColorYellow,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: Column(
                    children: [
                      Text("เกมบัตรคำ", style: TextStyle(fontFamily: 'TH-Chara',fontSize: 40),),
                      Expanded(
                      child: GridView.count(
                        primary: false,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            padding: const EdgeInsets.all(8),
                            child: const Text(
                              "ผลไม้",
                              style: TextStyle(fontFamily: 'TH-Chara', fontSize: 50),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            padding: const EdgeInsets.all(8),
                            child: const Text(
                              "ครอบครัวของฉัน",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontFamily: 'TH-Chara', fontSize: 35,),
                            ),
                          ),
                        ],
                      ),
                    ),],
                  ),
                )),
          )),
    ));
  }
}

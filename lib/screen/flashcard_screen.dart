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
      body: SafeArea(
        child: Stack(children: [
          Container(
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
                        color: kColorYellow,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child: Column(
                          children: [
                            Text(
                              "เกมบัตรคำ",
                              style: TextStyle(
                                  fontFamily: 'TH-Chara', fontSize: 40),
                            ),
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
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    padding: const EdgeInsets.all(8),
                                    child: const Text(
                                      "ผลไม้",
                                      style: TextStyle(
                                          fontFamily: 'TH-Chara', fontSize: 35),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    padding: const EdgeInsets.all(8),
                                    child: const Text(
                                      "ครอบครัวของฉัน",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'TH-Chara',
                                        fontSize: 35,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                )),
          ),
          Positioned(
              top: 15,
              left: 15,
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: BackButton())),
        ]),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(5),
        child: buildAddButton(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

Widget BackButton() => Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: Icon(Icons.arrow_back),
    );

Widget buildAddButton() => FloatingActionButton.extended(
      backgroundColor: kColorLightYellow,
      label: Text(
        'เพิ่มบัตรคำ',
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w300,
            fontFamily: 'TH-Chara',
            fontSize: 30),
      ),
      onPressed: () {},
    );

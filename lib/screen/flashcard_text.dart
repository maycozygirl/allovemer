import 'dart:developer';
import 'dart:math' as math;

import 'package:al_lover_mer/Themes/colors.dart';
import 'package:al_lover_mer/flashcard_datafruit.dart';
import 'package:al_lover_mer/flashcard_datavegetable.dart';
import 'package:al_lover_mer/utils/showSnackBar.dart';
import 'package:al_lover_mer/widget/input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FlashcardText extends StatefulWidget {
  FlashcardText({super.key, this.type});
  String? type;

  @override
  State<FlashcardText> createState() => _FlashcardTextState();
}

class _FlashcardTextState extends State<FlashcardText> {
  String? name;
  List data = [];
  final random = new math.Random.secure();
  int index = 0;
  TextEditingController answerController = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState
    setState(() {});
    if (widget.type != null) {
      if (widget.type == "fruit") {
        setState(() {
          data = List.from(dataFlashcardFruit);
      index = random.nextInt(data.length);
        });
      }
      if (widget.type == "vegetable") {
        setState(() {
          data = List.from(dataFlashcardVegetable);
      index = random.nextInt(data.length);

        });
      }

    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    answerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(children: [
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/bg_Home.jpg"),
                    fit: BoxFit.cover)),
            child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Center(
                  child: Container(
                    width: 330,
                    height: 500,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Spacer(),
                        Container(
                          height: 250,
                          width: 250,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("${data[index]['image']}"),
                                  fit: BoxFit.fill)),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            controller: answerController,
                            style: TextStyle(
                                fontFamily: 'TH-Chara',
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                labelText: '???????????????',
                                border: OutlineInputBorder()),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ))),
        Positioned(
            top: 730,
            left: 100,
            right: 100,
            child: InkWell(
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      )
                    ],
                    color: kColorYellow),
                child: Text(
                  "???????????????",
                  style: TextStyle(
                      fontFamily: "TH-Chara",
                      fontWeight: FontWeight.w300,
                      fontSize: 30),
                ),
              ),
              onTap: () {
                if (answerController.text == data[index]['answer']) {
                  data.removeWhere(
                      (item) => item['answer'] == answerController.text);
                  if (data.isNotEmpty) {
                    setState(() {
                      index = random.nextInt(data.length);
                    });
                  }
                } else {
                  if (data.isNotEmpty) {
                    final snackBar = SnackBar(
                      content: Text(
                        "???????????????????????? ?????????????????????????????????????????????????????????",
                        style: TextStyle(fontFamily: "TH-Chara", fontSize: 20),
                      ),
                      backgroundColor: Colors.red,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                }

                if (data.isEmpty) {
                  Navigator.pushNamed(context, '/congrate');
                }
                // }
                //TODO :: congrate modal check
                //TODO :: snackbar check
                log(index.toString());
                answerController.text = '';
                // Navigator.pop(context);
              },
            ))
      ]),
    );
  }
}

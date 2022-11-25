import 'package:al_lover_mer/Themes/colors.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CongrateScreen extends StatefulWidget {
  const CongrateScreen({super.key});

  @override
  State<CongrateScreen> createState() => _CongrateScreenState();
}

class _CongrateScreenState extends State<CongrateScreen> {
  final controller = ConfettiController();
  bool isplaying = false;

  void initState() {
    super.initState();
    controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topCenter, children: [
      Scaffold(
          body: SafeArea(
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg.jpg"), fit: BoxFit.cover),
            ),
            child: Center(
                child: Container(
                    width: 330,
                    height: 500,
                    decoration: BoxDecoration(
                      color: kColorGreen,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Spacer(),
                        Text(
                          "Congratulation",
                          style: TextStyle(
                              color: Colors.black54,
                              fontFamily: "TH-Chara",
                              fontWeight: FontWeight.w600,
                              fontSize: 50),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          "ยินดีด้วย",
                          style: TextStyle(
                              color: Colors.black54,
                              fontFamily: "TH-Chara",
                              fontWeight: FontWeight.w500,
                              fontSize: 50),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "เกมจบแล้ว",
                          style: TextStyle(
                              color: Colors.black54,
                              fontFamily: "TH-Chara",
                              fontSize: 50),
                        ),
                        Spacer()
                      ],
                    ))),
          ),
          Positioned(
              top: 15,
              left: 15,
              child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/flashcard');
                  },
                  child: BackButton()))
        ]),
      )),
      ConfettiWidget(
        confettiController: controller,
        shouldLoop: true,
        blastDirectionality: BlastDirectionality.explosive,
        colors: const [
          kColorGreen,
          kColorBlue,
          kColorLightGreen,
          kColorLightYellow,
          kColorPurple,
          kColorRed,
          kColorPink,
          kColorYellow
        ],
      ),
    ]);
  }
}

Widget BackButton() => Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: Icon(Icons.arrow_back),
    );

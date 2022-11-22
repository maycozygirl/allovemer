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
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: Column(
                    children: [
                      Text(
                        "ติดต่อขอความช่วยเหลือ",
                        style: TextStyle(fontFamily: 'TH-Chara', fontSize: 35),
                      ),
                      Expanded(
                            child: ListView.builder(
                        itemCount: 6, //เดี๋ยวเชื่อมฐานข้อมูล
                        itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8),
                              child: Container(
                                height: 100,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(25)),
                              ),
                            );
                        },
                      ),
                      )
                    ],
                  ),
                ),
              ),
            )),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: buildAddButton(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

Widget buildAddButton() => FloatingActionButton.extended(
      backgroundColor: kColorLightYellow,
      label: Text(
        'เพิ่มยาประจำตัว',
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w300,
            fontFamily: 'TH-Chara',
            fontSize: 30),
      ),
      onPressed: () {},
    );

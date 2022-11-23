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
                      color: kColorRed,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                      child: Column(
                        children: [
                          Text(
                            "ติดต่อขอความช่วยเหลือ",
                            style:
                                TextStyle(fontFamily: 'TH-Chara', fontSize: 35),
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
                                        borderRadius:
                                            BorderRadius.circular(25)),
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
          Positioned(
              top: 15,
              left: 15,
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: BackButton()))
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
        'เพิ่มเบอร์โทรศัพท์',
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w300,
            fontFamily: 'TH-Chara',
            fontSize: 30),
      ),
      onPressed: () {},
    );

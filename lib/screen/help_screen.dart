import 'package:al_lover_mer/Themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

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
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              FlutterPhoneDirectCaller.callNumber('1669');
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                height: 50,
                                width: 280,
                                child: Column(children: [
                                  Spacer(),
                                  Text(
                                    'ศูนย์การแพทย์ฉุกเฉิน : 1669',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  Spacer(),
                                ])),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              FlutterPhoneDirectCaller.callNumber('1668');
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                height: 50,
                                width: 280,
                                child: Column(children: [
                                  Spacer(),
                                  Text(
                                    'สายด่วนโควิด-19 : 1668',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  Spacer(),
                                ])),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              FlutterPhoneDirectCaller.callNumber('1554');
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                height: 50,
                                width: 280,
                                child: Column(children: [
                                  Spacer(),
                                  Text(
                                    'วชิรพยาบาล : 1554',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  Spacer(),
                                ])),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(onTap: () {
                            FlutterPhoneDirectCaller.callNumber('191');
                          },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  height: 50,
                                  width: 280,
                                  child: Column(children: [
                                    Spacer(),
                                    Text(
                                      'สถานีตำรวจ : 191',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    Spacer(),
                                  ]))
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(onTap: () {
                            FlutterPhoneDirectCaller.callNumber('1323');
                          },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  height: 50,
                                  width: 280,
                                  child: Column(children: [
                                    Spacer(),
                                    Text(
                                      'สายด่วนสุขภาพจิต : 1323',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    Spacer(),
                                  ]))
                          ),
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

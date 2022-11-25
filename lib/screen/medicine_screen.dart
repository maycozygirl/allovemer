import 'package:al_lover_mer/Themes/colors.dart';
import 'package:flutter/material.dart';

class MedicineScreen extends StatefulWidget {
  const MedicineScreen({super.key});

  @override
  State<MedicineScreen> createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
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
                        color: kColorGreen,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child: Column(
                          children: [
                            Text(
                              "ยาประจำตัว",
                              style: TextStyle(
                                  fontFamily: 'TH-Chara', fontSize: 40),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                                width: 300,
                                height: 100,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Spacer(),
                                      Text(
                                        "ชื่อยา : Aricept   ",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Spacer(),
                                      Text(
                                        "จำนวนเม็ด : 1 เม็ด  ",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Spacer(),
                                      Text(
                                        "เวลา : 21.00      ",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Spacer()
                                    ],
                                  ),
                                ))
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
                  child: BackButton()))
        ]),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(5),
        child: buildAddButton(context),
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

Widget buildAddButton(BuildContext context) => FloatingActionButton.extended(
      backgroundColor: kColorLightYellow,
      label: Text(
        'เพิ่มยาประจำตัว',
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w300,
            fontFamily: 'TH-Chara',
            fontSize: 30),
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/addmedicine');
      },
    );

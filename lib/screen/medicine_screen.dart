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
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.jpg"),
                fit: BoxFit.cover)),
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
              ),
            )),
      ),
      floatingActionButton: buildAddButton(),
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
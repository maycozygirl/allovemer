import 'package:al_lover_mer/Themes/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg_Home.jpg"), fit: BoxFit.cover)),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Custom_button(
              text: 'เกมบัตรคำ',
              onPressed: () {
                Navigator.pushNamed(context, "/flashcard");
              },
              backgroundColor: kColorYellow,
            ),
            SizedBox(
              height: 30,
            ),
            Custom_button(
                text: 'ยาประจำตัว',
                backgroundColor: kColorGreen,
                onPressed: () {
                  Navigator.pushNamed(context, "/medicine");
                }),
            SizedBox(
              height: 30,
            ),
            Custom_button(
                text: 'วันสำคัญ',
                backgroundColor: kColorPurple,
                onPressed: () {
                  Navigator.pushNamed(context, "/diary");
                }),
            SizedBox(
              height: 30,
            ),
            Custom_button(
                text: 'ติดต่อขอความช่วยเหลือ',
                backgroundColor: kColorRed,
                onPressed: () {
                  Navigator.pushNamed(context, "/help");
                })
          ],
        )),
      ),
    );
  }
}

class Custom_button extends StatelessWidget {
  const Custom_button(
      {Key? key,
      required this.text,
      required this.backgroundColor,
      required this.onPressed})
      : super(key: key);

  final String text;
  final Color backgroundColor;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 150,
        width: 300,
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(45)),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}

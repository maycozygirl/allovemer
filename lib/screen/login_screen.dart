import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg_Signin.jpg"), fit: BoxFit.cover)),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Text('กรอกข้อมูลผู้ป่วย',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'TH-Chara', fontSize: 40)),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';
import 'dart:developer';

import 'package:al_lover_mer/Themes/colors.dart';
import 'package:al_lover_mer/model/user_model.dart';
import 'package:al_lover_mer/routes.dart';
import 'package:al_lover_mer/service/auth_service.dart';
import 'package:al_lover_mer/widget/main_btn_widget.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/input_decoration.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final formKey = GlobalKey<FormState>();
  late StreamSubscription<User?> userStreamSub;
  String? email,password;

@override
void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async { 
      final authService = Provider.of<AuthService>(context,listen: false);
      final userStream = authService.userStream;

      userStreamSub = userStream!.listen((user) {
        if (user != null && mounted){
          Navigator.pushNamedAndRemoveUntil(context,'/home',(routes)=> false);
        }
       });

    });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    userStreamSub.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg_Signin.jpg"), fit: BoxFit.cover)),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50,bottom: 10),
                child: Text('Allovemer',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'TH-Chara', fontSize: 50)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text('เข้าสู่ระบบ',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'TH-Chara', fontSize: 40)),
              ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  FillEmail(),
                  FillPassword()
                ],
              ),
            ),
             Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: InkWell(
                 onTap: () {
                      loginHandle(context: context);
                  },
                  child: MainBtnWidget(
                        colorBtn: kColorPurple,
                         textBtn: 'เข้าสู่ระบบ',
                         isTransparent: false,
                         haveIcon: false))),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: InkWell(
                 onTap: () {
                      Navigator.pushNamed(context, '/register');
                  },
                  child: MainBtnWidget(
                        colorBtn: kColorPurple,
                         textBtn: 'สมัครสมาชิก',
                         isTransparent: false,
                         haveIcon: false))),
            ]
          ),
        )
        )
    );

  }

   Widget FillEmail() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: TextFormField(
          keyboardType: TextInputType.text,
          autofocus: false,
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Colors.black),
          decoration: InputDecorationWidget(context,'อีเมลล์'),
          validator: (value) {
            if (value!.isEmpty) {
              return "กรุณากรอกอีเมลล์";
            }
            return null;
          },
          onChanged: (value) {
            email = value;
          },
        ));
  }
  Widget FillPassword() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: TextFormField(
          keyboardType: TextInputType.text,
          autofocus: false,
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Colors.black),
          decoration: InputDecorationWidget(context,'รหัสผ่าน'),
          validator: (value) {
            if (value!.isEmpty) {
              return "กรุณากรอกรหัสผ่าน";
            }
            return null;
          },
          onChanged: (value) {
            password = value;
          },
        ));
  }

  Future<void> loginHandle({required BuildContext context}) async {
    final authService = Provider.of<AuthService>(context, listen: false);

    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      showDialog(
          context: context,
          builder: ((context) => Center(
                child: CircularProgressIndicator(strokeWidth: 4),
              )));

      try {
        await authService.signInWithEmailAndPassword(
            email: email, password: password);
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/home', (route) => false);
      } on auth.FirebaseAuthException catch (e) {
        log(e.message!);
        Navigator.pop(context);
      }
    }
  }
}
import 'dart:developer';

import 'package:al_lover_mer/Themes/colors.dart';
import 'package:al_lover_mer/service/auth_service.dart';
import 'package:al_lover_mer/widget/main_btn_widget.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/user_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? user;

  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context, listen: false);

    authService.currentUser().then((currentUser) {
      if (mounted) {
      setState(() {
        user = currentUser;
      });
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
           Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/bg.jpg"), fit: BoxFit.cover)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top:20.0),
                  child: Center(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Center(
                          child: user?.photoURL != null ? 
                          Container(
                            width: 150,
                            height: 150,
                            child:  Image.network('${user?.photoURL}' ,fit: BoxFit.fill,) ,
                          )
                          : Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15),),
                              color: Colors.white,
                            ),
                            ),
                          ),
                        SizedBox(height: 20,),
                        Text('คุณ ${user?.name}' ,textAlign: TextAlign.center ,style: TextStyle(fontFamily: 'TH-Chra',fontSize: 20),),
                        SizedBox(height: 10,),
                        Text('อายุ ${user?.age} ปี ',textAlign: TextAlign.center ,style: TextStyle(fontFamily: 'TH-Chra',fontSize: 20)),
                        SizedBox(height: 10,),
                        Text('เบอร์ติดต่อผู้ดูแล : ${user?.tel}',textAlign: TextAlign.center ,style: TextStyle(fontFamily: 'TH-Chra',fontSize: 20)),
                        SizedBox(height: 20,),
                        InkWell(
                          onTap: (){
                            logoutHandle(context: context);
                          },
                          child: MainBtnWidget(colorBtn: kColorRed, textBtn: 'Sign Out', isTransparent: false, haveIcon: false))
                      ],
                    ),
                  ),
                ),
              ),
            Positioned(
              top: 15,
              left: 15,
              child: InkWell(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: BackButton(),
              )
            )
          ]
        ),
      ),
         
        
      );
  }
  Future<void> logoutHandle({required BuildContext context}) async {
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signOut();
      Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
    } on auth.FirebaseAuthException catch (e) {
      log(e.message!);

    }
  }
  
}

Widget BackButton() => Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: Icon(Icons.arrow_back),
    );
import 'dart:js';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

import '../Themes/colors.dart';
import '../widget/input_decoration.dart';
import '../widget/main_btn_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  final formKey = GlobalKey<FormState>();
  String? name,nickname,age,weight,height,tel;
  File? imageFile;
  final picker = ImagePicker();
 

  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg_Signin.jpg"), fit: BoxFit.cover)),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text('กรอกข้อมูลผู้ป่วย',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'TH-Chara', fontSize: 40)),
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                   Padding(
                      padding: const EdgeInsets.all(20),
                      child: InkWell(
                        onTap: () {
                          
                        },
                        // (เงื่อนไข) ? คำสั่ง1 : คำสั่ง2
                        child: imageFile != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.file(
                                  imageFile!,
                                  width: 150,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                        color: Colors.white,
                                    ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 50),
                                  child: Text("เพ่ิมรูป",textAlign: TextAlign.center,style: TextStyle(fontFamily: 'TH-Chara',fontSize: 30 ),),
                                ),
                              ),
                      ),
                    ),
                  CreateName(),
                  CreateNickname(),
                  CreateAge(),
                  CreateWeight(),
                  CreateHeight(),
                  CreateTel()
                ],
              )
            ),
            Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/home");
                    },
                    child: MainBtnWidget(
                        colorBtn: kColorGreen,
                        textBtn: 'Sign Up',
                        isTransparent: false,
                        haveIcon: false))),
          ],
        
        ),
        
      ),
      
    );
  }

  Widget CreateName() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: TextFormField(
          keyboardType: TextInputType.text,
          autofocus: false,
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Colors.black),
          decoration: InputDecorationWidget(context,'ชื่อ-นามสกุล'),
          validator: (value) {
            if (value!.isEmpty) {
              return "กรุณากรอกชื่อ-นามสกุล";
            }
            return null;
          },
          onChanged: (value) {
            name = value;
          },
        ));
  }

  Widget CreateNickname() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: TextFormField(
          keyboardType: TextInputType.text,
          autofocus: false,
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Colors.black),
          decoration: InputDecorationWidget(context,'ชื่อเล่น'),
          validator: (value) {
            if (value!.isEmpty) {
              return "กรุณากรอกชื่อเล่น";
            }
            return null;
          },
          onChanged: (value) {
            nickname = value;
          },
        ));
  }

 
  Widget CreateAge() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: TextFormField(
          keyboardType: TextInputType.text,
          autofocus: false,
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Colors.black),
          decoration: InputDecorationWidget(context,'อายุ'),
          validator: (value) {
            if (value!.isEmpty) {
              return "กรุณากรอกอายุ";
            }
            return null;
          },
          onChanged: (value) {
            age = value;
          },
        ));
  }
  Widget CreateWeight() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: TextFormField(
          keyboardType: TextInputType.text,
          autofocus: false,
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Colors.black),
          decoration: InputDecorationWidget(context,'น้ำหนัก'),
          validator: (value) {
            if (value!.isEmpty) {
              return "กรุณากรอกน้ำหนัก";
            }
            return null;
          },
          onChanged: (value) {
            weight = value;
          },
        ));
  }
  Widget CreateHeight() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: TextFormField(
          keyboardType: TextInputType.text,
          autofocus: false,
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Colors.black),
          decoration: InputDecorationWidget(context,'ส่วนสูง'),
          validator: (value) {
            if (value!.isEmpty) {
              return "กรุณากรอกส่วนสูง";
            }
            return null;
          },
          onChanged: (value) {
            height = value;
          },
        ));
  }
  Widget CreateTel() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: TextFormField(
          keyboardType: TextInputType.text,
          autofocus: false,
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Colors.black),
          decoration: InputDecorationWidget(context,'เบอร์โทรผู้ดูแล'),
          validator: (value) {
            if (value!.isEmpty) {
              return "กรุณากรอกเบอร์โทรผู้ดูแล";
            }
            return null;
          },
          onChanged: (value) {
            tel = value;
          },
        ));
  }

}






import 'dart:io';
import 'dart:math';
import 'package:al_lover_mer/service/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import '../Themes/colors.dart';
import '../service/auth_service.dart';
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
  String? email,password,name,age,tel;
  File? photoURL;
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
                          showButtomSheet(context);
                        },
                        // (เงื่อนไข) ? คำสั่ง1 : คำสั่ง2
                        child: photoURL != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.file(
                                  photoURL!,
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
                  CreateEmail(),
                  CreatePassword(),
                  CreateName(),
                  CreateAge(),
                  CreateTel()
                ],
              )
            ),
            Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: InkWell(
                    onTap: () {
                      registerHandle(context: context);
                      Navigator.pushNamed(context, "/login");
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

  Widget CreateEmail() {
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
  
  Widget CreatePassword() {
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


   Future<void> registerHandle({required BuildContext context}) async {
    final authService = Provider.of<AuthService>(context, listen: false);
    final storageService = Provider.of<StorageService>(context, listen: false);
    String? photourl;

    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();

    if (photoURL != null) {
      photourl = await storageService.uploadProductImage(imageFile:photoURL!);
    }

    print(photoURL);
    

      showDialog(
          context: context,
          builder: ((context) => Center(
                child: CircularProgressIndicator(strokeWidth: 4),
              )));

      try {
        await authService.createUser(
          photoURL:photourl,
          email: email,
          password: password,
          name: name,
          age: age,
          tel: tel,

        ).then((value) => print(value.tel));
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/login', (route) => false);
      } on auth.FirebaseAuthException catch (e) {
        Navigator.of(context).pop();
      }
    }
  }

  Future<void> showButtomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: Wrap(
              children: [
                ListTile(
                  onTap: () {
                    openGallery(context);
                  },
                  leading: SvgPicture.asset(
                    'assets/icons/gallery.svg',
                    color: kColorPurple,
                  ),
                  title: Text('Gallery',
                      style: TextStyle(fontSize: 20),)
                ),
                ListTile(
                  onTap: () {
                    openCamera(context);
                  },
                  leading: SvgPicture.asset(
                    'assets/icons/camera.svg',
                    color: kColorPurple,
                  ),
                  title: Text('Camera',
                      style: TextStyle(fontSize: 20),)
                )
              ],
            ),
          );
        });
  }
  
  openGallery(BuildContext context) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        photoURL = File(pickedFile.path);
      } else {
        print('No Image selected');
      }
    });
    Navigator.of(context).pop();
  }

  openCamera(BuildContext context) async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        photoURL = File(pickedFile.path);
      } else {
        print('No Image selected');
      }
    });
    
 
}


}

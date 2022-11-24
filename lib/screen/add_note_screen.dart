import 'package:al_lover_mer/model/note_model.dart';
import 'package:al_lover_mer/service/storage_service.dart';
import 'package:al_lover_mer/widget/input_decoration.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../Themes/colors.dart';
import '../service/database_service.dart';
import '../widget/main_btn_widget.dart';


class AddnoteScreen extends StatefulWidget {
  const AddnoteScreen({super.key});

  @override
  State<AddnoteScreen> createState() => _AddnoteScreenState();
}

class _AddnoteScreenState extends State<AddnoteScreen> {

  TextEditingController _titleController =TextEditingController();
  TextEditingController _mainController = TextEditingController();

  String? note_title,note_date,note_content;
  String date= DateFormat("yyyy-MM-dd").format(DateTime.now());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/bg_Home.jpg"), fit: BoxFit.cover)),
            child: Padding(
              padding: EdgeInsets.only(top: 50),
              child: Center(
                child: Container(
                  width: 350,
                  height: 730,
                  decoration: BoxDecoration(
                    color: kColorPurple,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Text('จดบันทึก', style: TextStyle(fontFamily: 'TH-Chara',fontSize: 30),),
                      SizedBox(height: 10,),
                      CreateNoteTitle(),
                      SizedBox(height: 10,),
                      Text(date, style: TextStyle(fontFamily: 'TH-Chara',fontSize: 20),),
                      SizedBox(height: 20,),
                      CreateNoteContent(),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 20),
                        child: InkWell(
                            onTap: () async {
                              FirebaseFirestore.instance.collection('Notes').add({
                                "note_title":note_title,
                                "note_date": date,
                                "note_content": note_content
                              }).then((value){
                                print(value.id);
                                Navigator.pop(context);
                              }).catchError((error)=> print("Failed"));
                            },
                      child: MainBtnWidget(
                          colorBtn: kColorGreen,
                          textBtn: 'เพิ่มโน็ต',
                          isTransparent: false,
                          haveIcon: false))),
                    ],
                  ),
                  )
                )
              )
              ),
              Positioned(
              top: 15,
              left: 15,
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: BackButton())),
               
          ]
        ),
      )
        );
            
  }

  Widget BackButton() => Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: Icon(Icons.arrow_back),
    );

    Widget CreateNoteTitle() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: TextFormField(
          keyboardType: TextInputType.text,
          autofocus: false,
          style: TextStyle(
              fontSize: 16.0,
              color: Colors.black),
          decoration: InputDecorationWidget(context,'ชื่อบันทึก'),
          validator: (value) {
            if (value!.isEmpty) {
              return "กรุณาชื่อบันทึก";
            }
            return null;
          },
          onChanged: (value) {
            note_title = value;
          },
        ));
  }

  Widget CreateNoteContent() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: TextFormField(
          keyboardType: TextInputType.text,
          autofocus: false,
          style: TextStyle(
              fontSize: 16.0,
              color: Colors.black),
          validator: (value) {
            if (value!.isEmpty) {
              return "กรุณาใส่ข้อความ";
            }
            return null;
          },
          onChanged: (value) {
            note_content = value;
          },
        ));
  }

  

  
}




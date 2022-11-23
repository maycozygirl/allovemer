import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Themes/colors.dart';
import '../model/note_model.dart';

class NoteReaderScreen extends StatefulWidget {
  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  @override
  Widget build(BuildContext context) {
    final note = ModalRoute.of(context)!.settings.arguments as Note;
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/bg_Home.jpg"),
                    fit: BoxFit.cover)),
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
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "${note.note_title}",
                        style: TextStyle(
                          fontFamily: "TH-Chara",
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "${note.creation_date}",
                        style: TextStyle(
                          fontFamily: "TH-Chara",
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${note.note_content}",
                        style: TextStyle(
                          fontFamily: "TH-Chara",
                          fontSize: 25,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 15,
            left: 15,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
                // Navigator.pushNamedAndRemoveUntil(context, "/diary", (routename) => false);
              },
              child: BackButton(),
            ),
          ),
        ]),
      ),
    );
  }
}

Widget BackButton() => Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: Icon(Icons.arrow_back),
    );

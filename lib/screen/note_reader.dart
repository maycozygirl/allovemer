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
      body: Container(
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
                  StreamBuilder<List<Note>?>(
                      stream: getStreamListNote(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text('Error');
                        }
                        return Text(
                          "${note.note_title}",
                          style: TextStyle(
                            fontFamily: "TH-Chara",
                            fontSize: 25,
                          ),
                        );
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Stream<List<Note>?> getStreamListNote() {
    final firestoreInstance = FirebaseFirestore.instance;

    return firestoreInstance
        .collection('Notes')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              final noteMapinfo = doc.data();
              return Note(
                  creation_date: noteMapinfo['creation_date'],
                  note_content: noteMapinfo['note_content'],
                  note_title: noteMapinfo['note_title']);
            }).toList());
  }
}

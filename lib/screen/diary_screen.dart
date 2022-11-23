import 'dart:async';
import 'dart:developer';

import 'package:al_lover_mer/Themes/colors.dart';
import 'package:al_lover_mer/model/note_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({super.key});

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(children: [
            Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/bg.jpg"), fit: BoxFit.cover)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Center(
                    child: Container(
                        width: 350,
                        height: 730,
                        decoration: BoxDecoration(
                          color: kColorPurple,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Text(
                              "จดบันทึก",
                              style: TextStyle(
                                  fontFamily: 'TH-Chara', fontSize: 40),
                            ),
                          ),
                          StreamBuilder<List<Note>?>(
                              stream: getStreamListNote(),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  return Text('Error');
                                }
                                return Flexible(
                                  child: GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              childAspectRatio: 0.9),
                                      itemCount: snapshot.data?.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        if (snapshot.hasData) {
                                          log(snapshot.data!.length.toString());
                                          return Padding(
                                              padding: const EdgeInsets.all(6),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  AspectRatio(
                                                    aspectRatio: 1,
                                                    child: InkWell(
                                                      onTap: () {
                                                        Navigator.pushNamed(
                                                            context,
                                                            '/NoteReader',
                                                            arguments: snapshot
                                                                .data![index]);
                                                      },
                                                      child: Container(
                                                        width: 40,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(top: 0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SizedBox(
                                                                height: 20,
                                                              ),
                                                              Text(
                                                                "${snapshot.data![index].note_title}",
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      "TH-Chara",
                                                                  fontSize: 25,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                  "${snapshot.data![index].creation_date}",
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          "TH-Chara",
                                                                      fontSize:
                                                                          25)),
                                                              SizedBox(
                                                                height: 20,
                                                              ),
                                                              Text(
                                                                "${snapshot.data![index].note_content}",
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        "TH-Chara",
                                                                    fontSize:
                                                                        20),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ));
                                        } else {
                                          return Container();
                                        }
                                      }),
                                );
                              }),
                        ])),
                  ),
                )),
            Positioned(
              top: 15,
              left: 15,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: BackButton(),
              ),
            ),
          ]),
        ),
        floatingActionButton: buildAddButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
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

Widget BackButton() => Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: Icon(Icons.arrow_back),
    );

Widget buildAddButton() => FloatingActionButton.extended(
      backgroundColor: kColorLightYellow,
      label: Text(
        'เพิ่มบันทึก',
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w300,
            fontFamily: 'TH-Chara',
            fontSize: 30),
      ),
      onPressed: () => {},
    );
